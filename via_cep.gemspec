# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'via_cep/version'

Gem::Specification.new do |spec|
  spec.name          = "via_cep"
  spec.version       = ViaCep::VERSION
  spec.authors       = ["Marcelo Barreto"]
  spec.email         = ["marcelobarretojunior@gmail.com"]
  spec.summary       = %q{Get Brazil zip-code}
  spec.homepage      = "http://www.github.com/marcelobarreto/via_cep"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_dependency 'httparty'
end
