module IoMerchant
  class Address < ActiveRecord::Base
    self.table_name = :io_addresses


    belongs_to :buyer, :polymorphic => true

    validates_presence_of :street, :province


  end
end