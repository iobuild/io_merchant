require "active_record"
require "active_support/core_ext"
require "io_merchant/version"
require "acts_as_list"
require "aasm"


require 'io_merchant/address'
require 'io_merchant/sellable'
require 'io_merchant/buyer'
require 'io_merchant/line_item'
require 'io_merchant/order'

require 'io_merchant/shopping_cart/cart_item'
require 'io_merchant/shopping_cart/cart'

ActiveRecord::Base.send(:include, IoMerchant::Sellable)
ActiveRecord::Base.send(:include, IoMerchant::Buyer)


require 'io_merchant/railtie' if defined?(Rails)
