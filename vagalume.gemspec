# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "vagalume"
  spec.executables   = ["vagalume"]
  spec.version       = "0.1.7"
  spec.authors       = ["Brian Thomas Storti"]
  spec.email         = ["btstorti@gmail.com"]
  spec.description   = "Ruby interface for the Vagalume API"
  spec.summary       = "Ruby interface for the Vagalume API"
  spec.homepage      = "https://github.com/brianstorti/vagalume"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "multi_json", "~> 1.9"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "vcr", "~> 2.9"
  spec.add_development_dependency "webmock", "~> 1.17"
  spec.add_development_dependency "rspec", "~> 2.14"
end
