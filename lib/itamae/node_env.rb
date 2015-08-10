require "itamae"
require "itamae/node_env/version"

module Itamae
  module NodeEnv
    private

    def apply_env(val, klass = nil)
      klass ||= self.class

      case val
      when String
        val.gsub(/env\[(\w+?)\]/) { ENV[Regexp.last_match[1]] }
      when Array
        val.map { |v| apply_env(v, klass) }
      when klass
        val.each { |k, v| val[k] = apply_env(v, klass) }
        val
      else
        val
      end
    end
  end

  module NodeEnv11
    include NodeEnv

    def initialize(source_hash = nil, default = nil, &blk)
      super
      self.each do |key, val|
        self[key] = apply_env(val)
      end
    end
  end

  module NodeEnv12
    include NodeEnv

    def initialize(initial_hash, backend)
      super
      @mash = apply_env(@mash, Hashie::Mash)
    end
  end
end

major, minor, revision = ::Itamae::VERSION.split(".").map(&:to_i)

case minor.to_i
when 1
  ::Itamae::Node.send(:prepend, ::Itamae::NodeEnv11)
when 2
  ::Itamae::Node.send(:prepend, ::Itamae::NodeEnv12)
end
