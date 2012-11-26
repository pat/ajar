# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name          = 'ajar'
  gem.version       = '0.1.0'
  gem.authors       = ['Pat Allan']
  gem.email         = ['pat@freelancing-gods.com']
  gem.summary       = 'Redirect Facebook to Ajar versions of local pages.'
  gem.description   = "Uses Ajar's API to insert public URIs in place of local APIs for Facebook Open Graph connections."
  gem.homepage      = 'https://github.com/pat/ajar'
  
  gem.files         = `git ls-files`.split($/)
  gem.executables   = []
  gem.test_files    = []
  gem.require_paths = ['lib']
  
  gem.add_runtime_dependency 'httparty', '>= 0'
  gem.add_runtime_dependency 'koala',    '>= 0'
end
