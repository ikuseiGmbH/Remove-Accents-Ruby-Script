# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'remove_accents/version'

Gem::Specification.new do |spec|
  spec.name          = "remove_accents"
  spec.version       = RemoveAccents::VERSION
  spec.authors       = ["Marco Metz"]
  spec.email         = ["marco.metz@gmail.com"]
  spec.summary       = %q{String class to convert "àéêîôûù" to "aeeiouu"}
  spec.description   = %q{You can use this extension to the String class to convert "àéêîôûù" to "aeeiouu".}
  spec.homepage      = "https://github.com/ikuseiGmbH/Remove-Accents-Ruby-Script"
  spec.license       = "GNU GENERAL PUBLIC LICENSE"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency 'guard-rspec'
  #spec.add_development_dependency 'pry'
end
