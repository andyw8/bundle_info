# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bundle_info/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andy Waite"]
  gem.email         = ["github.aw@andywaite.com"]
  gem.description   = "Command-line tool to display information about all the gems in a project's Gemfile"
  gem.summary       = "Command-line tool to display information about all the gems in a project's Gemfile"
  gem.homepage      = "https://github.com/andyw8/bundle_info"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bundle_info"
  gem.require_paths = ["lib"]
  gem.version       = BundleInfo::VERSION

  gem.add_dependency "gemnasium-parser"
  gem.add_dependency "gems"
  gem.add_dependency "activesupport"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "vcr"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "aruba"
end
