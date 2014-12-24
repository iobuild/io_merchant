require 'io_merchant/migrations/cart'

CreateIoMerchantCartTables.change


ActiveRecord::Schema.define :version => 0 do


  create_table :products, :force => true do |t|
    t.column :title, :string
    t.column :description, :text
    t.column :type, :string
    t.column :price, :integer, :null => false, :default => 0
  end

  create_table :users, :force => true do |t|
    t.column :name, :string
    t.column :email, :string
    t.column :kind, :string
  end
end
