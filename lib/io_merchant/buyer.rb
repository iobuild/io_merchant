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
      end
    end

    module InstanceMethods

      def set_unique_default(address)
        self.addresses.each do |item|
          if item.id == address.id
            address.is_default = true
            address.save
            next
          end

          item.is_default = false
          item.save

        end

      end


      def default_address
        if self.addresses.where(:is_default => true).exists?
          return self.addresses.where(:is_default => true).first
        end

        a = self.addresses.first
        self.set_unique_default(a)
        a
      end


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