require "itamae"
require "itamae/node_env/version"

module Itamae
  module NodeEnv
    def [](key)
      val = super(key)
      if /\Aenv\[([^\]]+)\]\z/ =~ val
        ENV[$1]
      else
        val
      end
    end
  end
end

::Itamae::Node.send(:prepend, ::Itamae::NodeEnv)

Dotenv.load if Object.const_defined?(:Dotenv)

