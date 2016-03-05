# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'via_cep/version'

Gem::Specification.new do |s|
  s.name          = "via_cep"
  s.version       = ViaCep::VERSION
  s.authors       = ["Marcelo Barreto"]
  s.email         = ["marcelobarretojunior@gmail.com"]
  s.summary       = %q{Get Brazil zip-code}
  s.homepage      = "http://www.github.com/marcelobarreto/via_cep"
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir        = "exe"
  s.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec"
  s.add_dependency 'httparty'
  s.add_development_dependency 'codeclimate-test-reporter'
end
