$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'img_cli/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'img_cli'
  s.version     = ImgCLI::VERSION
  s.authors     = ['Nelson Lee']
  s.email       = ['ilung.me@gmail.com']
  s.homepage    = 'https://www.ilung.me'
  s.summary     = 'A simple tool to extract EXIF data'
  s.description = 'A simple tool to extract EXIF data from jpg and jpeg and outputs to html or csv'
  s.license     = 'MIT'
  s.files       = Dir['{lib}/**/*', 'MIT-LICENSE', 'README.md']
  s.required_ruby_version = '>= 2.5.0'
  s.executables << 'img_cli'

  s.add_development_dependency 'awesome_print', '~> 1.6'
  s.add_development_dependency 'byebug', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.3'

  s.add_runtime_dependency 'bundler', '~> 1.10'
  s.add_runtime_dependency 'commander', '~> 4.4'
  s.add_runtime_dependency 'exifr', '~> 1.3'
  s.add_runtime_dependency 'pastel', '~> 0.7'
  s.add_runtime_dependency 'terminal-table', '~> 1.8'
  s.add_runtime_dependency 'tty-spinner', '~> 0.8'
end
