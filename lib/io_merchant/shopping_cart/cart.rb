module IoMerchant
  module ShoppingCart
    class Cart < ActiveRecord::Base
      self.table_name = "carts"

      has_many :cart_items, :dependent => :destroy, :class_name => "::IoMerchant::ShoppingCart::CartItem"


      def add(a_sellable, quantity = 1)
        cart_item = item_for(a_sellable)

        if cart_item
          cumulative = cart_item.quantity ? cart_item.quantity : 0
          cart_item.quantity = cumulative + quantity
          cart_item.save
        else
          price = a_sellable.price * quantity
          cart_items.create(sellable: a_sellable, amount: price, quantity: quantity)
        end
      end


      def clear
        cart_items.clear
      end

      def empty?
        cart_items.empty?
      end

      def remove_by_sellable(a_sellable, quantity = 1)
        cart_item = item_for(a_sellable)
        if cart_item
          return cart_item.delete if cart_item.quantity <= quantity
         
          cart_item.quantity = cart_item.quantity - quantity
          cart_item.save
        end
      end

      def remove_by_item(cart_item)
        cart_items.find(cart_item.id).delete
      end


      def amount
        cart_items.inject(0){|sum, e| sum += e.amount }
      end



      self.send :include, IoMerchant::ShoppingCart::CartItem::InstanceMethods


    end
  end
end
