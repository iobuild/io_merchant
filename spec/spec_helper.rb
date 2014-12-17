ENV['RACK_ENV'] = 'test'
require "bundler"
require 'io_merchant'


Bundler.require(:default, :test)
