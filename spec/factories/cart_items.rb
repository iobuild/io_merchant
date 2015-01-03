FactoryGirl.define do
  factory :cart_item, :class => IoMerchant::ShoppingCart::CartItem do |t|
    t.name "This is a name"
    t.quantity 1
    
    t.sellable {|u| u.association(:sellable) }
    t.cart {|u| u.association(:cart) }


  end

end
