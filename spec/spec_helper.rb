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



def products(key, options = {})
  values = YAML::load_file(File.expand_path("../fixtures/products.yml", __FILE__))
  (values[key.to_s]["type"] || "Product").constantize.create! values[key.to_s].merge(options)
end



class Product < ActiveRecord::Base
  acts_as_sellable

end



class User < ActiveRecord::Base
  # self.inheritance_column = nil

end

class Buyer < User

  acts_as_buyer
end

