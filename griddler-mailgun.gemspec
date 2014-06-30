# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'griddler/mailgun/version'

Gem::Specification.new do |spec|
  spec.name          = "griddler-mailgun"
  spec.version       = Griddler::Mailgun::VERSION
  spec.authors       = ["Brad Pauly"]
  spec.email         = ["hi@bradpauly.com"]
  spec.summary       = %q{Mailgun adapter for Griddler}
  spec.description   = %q{Adapter to allow the use of mailgun forwarded routes with Griddler.}
  spec.homepage      = "https://github.com/bradpauly/griddler-mailgun"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'

  spec.add_dependency 'griddler'
end
