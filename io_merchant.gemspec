# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'io_merchant/version'

Gem::Specification.new do |spec|
  spec.name          = "io_merchant"
  spec.version       = IoMerchant::VERSION
  spec.authors       = ["Arly Xiao"]
  spec.email         = ["arlyxiao@163.com"]
  spec.summary       = %q{A lightweight E-commerce gem.}
  spec.description   = %q{A lightweight E-commerce gem.}
  spec.homepage      = "https://github.com/iobuild/io_merchant"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec-rails', '~> 2.14.0'


  spec.add_development_dependency "sqlite3"


  spec.add_dependency "activerecord"
  spec.add_dependency "acts_as_list"
  spec.add_dependency "aasm"
end
