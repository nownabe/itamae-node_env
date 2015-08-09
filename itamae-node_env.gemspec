# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/node_env/version'

Gem::Specification.new do |spec|
  spec.name          = "itamae-node_env"
  spec.version       = Itamae::NodeEnv::VERSION
  spec.authors       = ["nownabe"]
  spec.email         = ["nownabe@gmail.com"]
  spec.summary       = %q{Environment variables in the node file}
  spec.homepage      = "https://github.com/nownabe/itamae-node_env"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "itamae", '>= 1.1.1'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
