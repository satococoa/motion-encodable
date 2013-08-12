# -*- encoding: utf-8 -*-
VERSION = "0.0.3"

Gem::Specification.new do |spec|
  spec.name          = "motion-encodable"
  spec.version       = VERSION
  spec.authors       = ["Satoshi Ebisawa"]
  spec.email         = ["e.satoshi@gmail.com"]
  spec.description   = %q{Implement NSCoding protocol methods with ease for RubyMotion.}
  spec.summary       = %q{Implement NSCoding protocol methods with ease for RubyMotion.}
  spec.homepage      = "https://github.com/satococoa/motion-encodable"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_development_dependency "bundler", "~> 1.3"
end
