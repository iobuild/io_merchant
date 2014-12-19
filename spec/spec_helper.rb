ENV['RACK_ENV'] = 'test'
require "bundler"
require 'factory_girl_rails'
require 'io_merchant'


Bundler.require(:default, :test)


