require "itamae"
require "itamae/node_env/version"

module Itamae
  module NodeEnv
    def convert_env(val)
      case val
      when String then
        if /\Aenv\[([^\]]+)\]\z/ =~ val
          return ENV[$1]
        end
      when Array then
        return val.map {|v| convert_env(v)}
      when Hash then
        hash = Hash.new
        val.each {|k,v| hash[k] = convert_env(v)}
        return hash
      end
      return val
    end

    def initialize(source_hash = nil, default = nil, &blk)
      source_hash = convert_env(source_hash)
      super(source_hash, default, &blk)
    end
  end
end

::Itamae::Node.send(:prepend, ::Itamae::NodeEnv)

Dotenv.load if Object.const_defined?(:Dotenv)

