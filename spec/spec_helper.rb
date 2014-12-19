ENV['RACK_ENV'] = 'test'
require "bundler"
require "active_record"
require "active_support"
require "sqlite3"
require 'factory_girl_rails'
require 'io_merchant'


Bundler.require(:default, :test)


ENGINE_RAILS_ROOT = File.join(File.dirname(__FILE__), "../")
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }





ActiveRecord::Base.establish_connection :adapter => "sqlite3", :database => ":memory:"
ActiveRecord::Migration.verbose = false


require 'schema'
at_exit {ActiveRecord::Base.connection.disconnect!}
