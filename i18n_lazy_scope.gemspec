# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i18n_lazy_scope/version'

Gem::Specification.new do |spec|
  spec.name          = "i18n_lazy_scope"
  spec.version       = I18nLazyScope::VERSION
  spec.authors       = ["Mohamad El-Husseini"]
  spec.email         = ["husseini.mel@gmail.com"]
  spec.summary       = %q{Use lazy lookup with custom scopes in your locale files.}
  spec.description   = %q{I18nLazyScope lets you use lazy lookup and keep a better structure for your locale files when localising strings in your Ruby on Rails application. This means quicker translations without sacrificing the structure of your locale files.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "i18n"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
