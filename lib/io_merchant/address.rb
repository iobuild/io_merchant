module IoMerchant
  class Address < ActiveRecord::Base
    self.table_name = :io_addresses


    belongs_to :buyer, :polymorphic => true


  end
end