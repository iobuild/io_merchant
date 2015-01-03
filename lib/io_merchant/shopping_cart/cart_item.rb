module IoMerchant
  module ShoppingCart
    class CartItem < ActiveRecord::Base
      self.table_name = :io_cart_items

      belongs_to :sellable, :polymorphic => true
      belongs_to :cart, :class_name => "::IoMerchant::ShoppingCart::Cart"


      def amount
        self.quantity * self.sellable.price
      end


      module InstanceMethods

        # # Get cart item by a product/sellable
        def item_for(a_sellable)
          cart_items.where(:sellable => a_sellable).first
        end


        def update_quantity_for(a_sellable, new_quantity)
          item = item_for(a_sellable)
          item.update_attributes(:quantity => new_quantity) if item
        end

      end


    end
  end
end