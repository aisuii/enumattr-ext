# -*- encoding: utf-8 -*-
require File.expand_path('../lib/enumattr-ext/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["aisuii"]
  gem.email         = ["aisuiiaisuii@gmail.com"]
  gem.description   = %q{enumattr extensions}
  gem.summary       = %q{add enumattr features}
  gem.homepage      = "https://github.com/aisuii/enumattr-ext"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "enumattr-ext"
  gem.require_paths = ["lib"]
  gem.version       = Enumattr::Ext::VERSION

  gem.add_runtime_dependency('enumattr', '>= 0.0.5')
  gem.add_runtime_dependency('i18n', '>= 0.6.0')
  gem.add_runtime_dependency('activesupport', '>= 3.2.3')

  gem.add_development_dependency('rspec')
end
