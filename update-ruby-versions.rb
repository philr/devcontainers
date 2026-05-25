BUILD_YML_PATH = '.github/workflows/build.yml'
DOCKERFILE_PATH = 'multi-ruby/.devcontainer/Dockerfile'

LATEST=0
MAJOR=1
MINOR=2

SERIES_COMPONENTS_BY_ENGINE = {
  ruby: MINOR,
  jruby: MINOR,
  truffleruby: LATEST
}

ENGINE_SERIES_MAP = {
  # Ruby 3.5 became 4.0 between the first and second preview releases.
  [:ruby, [3, 5]] => [4, 0]
}

class Version
  include Comparable
  attr_reader :engine
  attr_reader :compare_version

  class << self
    def parse(full_version)
      engine, version = case full_version
      when /\A\d/
        [:ruby, full_version]
      when /\A(\w+)-(.+)\z/
        [$1.to_sym, $2]
      else
        nil
      end
      engine && Version.new(engine, version)
    end
  end

  def initialize(engine, version)
    @engine = engine
    @version = version
    @compare_version = Gem::Version.new(engine == :ruby && version =~ /\A(.+)-p(\d+)\z/ ? "#{$1}.#{$2}" : version)
  end

  def series(series_components)
    series = @version.split('.', series_components + 1)[0, series_components].map(&:to_i)
    series = ENGINE_SERIES_MAP[[@engine, series]] || series
    series.join('.')
  end

  def prerelease?
    @compare_version.prerelease?
  end

  def to_s
    "#{@engine == :ruby ? '' : "#{@engine}-"}#{@version}"
  end

  def hash
    [@engine, @compare_version].hash
  end

  def <=>(other)
    [self.engine_order, @compare_version] <=> [other.engine_order, other.compare_version]
  end

  protected

  def engine_order
    case @engine
    when :ruby
      :''
    else
      @engine
    end
  end
end

class Updater
  def initialize
    definitions = `ruby-build --definitions`
    raise "Failed to get definitions list from ruby-build" unless $?.success?

    series_by_engine = Hash.new {|h, k| h[k] = {} }

    definitions.each_line do |line|
      line.chomp!
      unless line.end_with?('dev')
        version = Version.parse(line)

        if version && (series_components = SERIES_COMPONENTS_BY_ENGINE[version.engine]) && !(series_components == 0 && version.prerelease?)
          latest_by_series = series_by_engine[version.engine]
          series = version.series(series_components)
          latest = latest_by_series[series]
          latest_by_series[series] = version unless latest && latest >= version
        end
      end
    end

    @versions_by_engine = series_by_engine.map do |engine, latest_by_series|
      [engine, latest_by_series.values.sort.reverse]
    end.to_h
  end

  def update_versions(path, pattern, default_pattern = nil)
    default_version = @versions_by_engine[:ruby].select {|v| !v.prerelease? }.first
    new_lines = []
    last_version = nil
    updated_versions = Set.new

    File.open(path, 'r') do |file|
      file.each_line do |line|
        if line =~ pattern
          prefix = $1
          version = Version.parse($2)
          suffix = $3

          if version && (series_components = SERIES_COMPONENTS_BY_ENGINE[version.engine])
            last_version = nil unless version.engine == last_version&.engine
            versions = @versions_by_engine[version.engine] || []
            versions.select {|v| v > version && (!last_version || v < last_version) }.each do |new_version|
              new_line = "#{prefix}#{new_version}#{suffix}"

              if new_version.series(series_components) == version.series(series_components)
                line = new_line
                version = new_version
              else
                new_lines << new_line
              end

              updated_versions << new_version
            end
            last_version = version
          end
        elsif default_pattern
          line.gsub!(default_pattern) do |_|
            match = Regexp.last_match
            updated_versions << default_version unless default_version.to_s == match[2]
            "#{match[1]}#{default_version}#{match[3]}"
          end
        end

        new_lines << line
      end
    end

    if updated_versions.any?
      File.open(path, 'w') do |file|
        file.write(*new_lines)
      end
    end

    updated_versions
  end
end

updater = Updater.new
updated = updater.update_versions(BUILD_YML_PATH, /\A(\s+\{\s*version:\s*")(.+?)(".+)\z/m)
updated |= updater.update_versions(DOCKERFILE_PATH, /\A(RUN\s+curl\s.+\/ruby-builds\/)(.+?)(-\$RUBY_OS-\$TARGETARCH\.tar\.xz".+)\z/m, /\A(.+\s+rbenv\s+global\s+")(.+?)(".+)\z/m)
puts updated.sort.join(', ') if updated.any?