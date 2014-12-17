require "active_record"
require "active_support/core_ext"
require "io_merchant/version"
require "acts_as_list"
require "aasm"


require 'io_merchant/addressable/addressable'
require 'io_merchant/addressable/address'
ActiveRecord::Base.send(:include, IoMerchant::Addressable)

require 'io_merchant/sellable'
require 'io_merchant/buyer'
require 'io_merchant/seller'

require 'io_merchant/line_item'
require 'io_merchant/order'
require 'io_merchant/purchase_order'
require 'io_merchant/sales_order'
require 'io_merchant/invoice'
require 'io_merchant/purchase_invoice'
require 'io_merchant/sales_invoice'

ActiveRecord::Base.send(:include, IoMerchant::Sellable)
ActiveRecord::Base.send(:include, IoMerchant::Buyer)
ActiveRecord::Base.send(:include, IoMerchant::Seller)

require 'io_merchant/shopping_cart/cart'
require 'io_merchant/shopping_cart/line_item'


require 'io_merchant/railtie' if defined?(Rails)