# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-swift-modular-headers/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-swift-modular-headers'
  spec.version       = CocoapodsSwiftModularHeaders::VERSION
  spec.authors       = ['Oskar Kwaśniewski']
  spec.email         = ['oskarkwasniewski@icloud.com']
  spec.description   = %q{A short description of cocoapods-swift-modular-headers.}
  spec.summary       = %q{A longer description of cocoapods-swift-modular-headers.}
  spec.homepage      = 'https://github.com/EXAMPLE/cocoapods-swift-modular-headers'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
