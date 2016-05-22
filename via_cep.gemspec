# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'via_cep/version'

Gem::Specification.new do |s|
  s.name          = "via_cep"
  s.version       = ViaCep::VERSION
  s.authors       = ["Marcelo Barreto"]
  s.email         = ["marcelobarretojunior@gmail.com"]
  s.summary       = %q{Brazillian zip-code information}
  s.homepage      = "http://www.github.com/marcelobarreto/via_cep"
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir        = "bin"
  s.executables   = ["zipcode"]
  s.require_paths = ["lib"]

  s.add_development_dependency 'bundler', '~> 1.10'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.4'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.5'
  s.add_dependency 'httparty', '~> 0.13'
  s.add_dependency 'activesupport', '~> 4.0'
  s.add_dependency 'i18n', '~> 0.7'
end
