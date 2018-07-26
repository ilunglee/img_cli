require 'bundler/setup'
Bundler.setup

require 'ap'
require 'byebug'
require 'img_cli'

Dir['./spec/support/**/*.rb'].each { |f| require f }
