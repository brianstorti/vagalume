# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "vagalume"
  spec.version       = "0.1.3"
  spec.authors       = ["Brian Thomas Storti"]
  spec.email         = ["btstorti@gmail.com"]
  spec.description   = "Ruby interface for the Vagalume API"
  spec.summary       = "Ruby interface for the Vagalume API"
  spec.homepage      = "https://github.com/brianstorti/vagalume"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
