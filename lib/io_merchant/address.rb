module IoMerchant
  class Address < ActiveRecord::Base
    self.table_name = "addresses"


    belongs_to :buyer, :polymorphic => true


  end
end