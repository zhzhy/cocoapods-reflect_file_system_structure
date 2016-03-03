# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods/reflect_file_system_structure/version'

Gem::Specification.new do |spec|
  spec.name          = "cocoapods-reflect_file_system_structure"
  spec.version       = Cocoapods::ReflectFileSystemStructure::VERSION
  spec.authors       = ["从权"]
  spec.email         = ["chaoyang.zcy@alibaba-inc.com"]

  spec.summary       = %q{reflect file system structure in xcodeproj.}
  spec.description   = %q{reflect file system structure in xcodeproj.}
  spec.homepage      = "https://github.com/zhzhy/cocoapods-reflect_file_system_structure"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
