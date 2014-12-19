module IoMerchant
  module Sellable
    def self.included(mod)
      mod.extend(ClassMethods)
    end

    module ClassMethods


      def acts_as_sellable(options = {})
        include IoMerchant::Sellable::InstanceMethods
        extend IoMerchant::Sellable::SingletonMethods

        has_many :line_items, :as => :sellable, :class_name => "IoMerchant::LineItem"
        has_many :orders, :through => :line_items, :class_name => "IoMerchant::Order"
      end
    end

    module SingletonMethods
      def sellable?
        true
      end
    end

    module InstanceMethods

      
    end

  end
end