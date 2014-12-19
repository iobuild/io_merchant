class CreateCartTables < ActiveRecord::Migration
  def self.change


    create_table :addresses do |t|
      t.integer  :buyer_id
      t.string   :buyer_type
      t.string   :firstname
      t.string   :lastname
      t.string   :province
      t.string   :city
      t.string   :street
      t.boolean  :is_default, :default => true
      t.datetime :canceled_at

      t.timestamps
    end


    create_table :orders do |t|
      t.string   :order_code
      t.integer  :buyer_id
      t.string   :buyer_type
      t.integer  :seller_id
      t.string   :seller_type
      t.decimal  :total_amount
      t.string   :status, :default => 'created', :null => false
      t.datetime :canceled_at

      t.timestamps
    end



    create_table :line_items do |t|
      t.integer  :order_id
      t.integer  :sellable_id
      t.string   :sellable_type
      t.integer  :quantity, :default => 1, :null => false
      t.integer  :amount,   :default   => 0, :null => false

      t.timestamps
    end


    create_table :carts do |t|

      t.timestamps
    end



    create_table :cart_items do |t|
      t.integer  :cart_id
      t.integer  :sellable_id
      t.string   :sellable_type
      t.string   :name
      t.integer  :quantity, :default => 1, :null => false
      t.integer  :amount,   :default   => 0, :null => false

      t.timestamps
    end



  end
end