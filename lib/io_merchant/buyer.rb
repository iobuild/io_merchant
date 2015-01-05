module IoMerchant
  module Buyer

    def self.included(mod)
      mod.extend(ClassMethods)
    end

    module ClassMethods
      def acts_as_buyer
        include IoMerchant::Buyer::InstanceMethods
        has_many :orders, :as => :buyer, :dependent => :destroy, :class_name => "::IoMerchant::Order"
        has_many :addresses, :as => :buyer, :dependent => :destroy, :class_name => "::IoMerchant::Address"
        has_one :cart, :as => :buyer, :dependent => :destroy, :class_name => "::IoMerchant::ShoppingCart::Cart"

        validates_uniqueness_of :buyer
      end
    end

    module InstanceMethods

      def purchase(cart)
        order = Order.create(:buyer => self, :total_amount => cart.amount)

        cart.cart_items.each do |item|
          LineItem.create(
            :order => order,
            :sellable => item.sellable,
            :quantity => item.quantity,
            :amount => item.amount
          )
        end
      end
     
    end

  end
end