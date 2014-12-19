require "spec_helper"

describe IoMerchant::ShoppingCart::Cart do
  before {
    @cart = FactoryGirl.create(:cart)
    @cart_item_1 = FactoryGirl.create(:cart_item, :cart => @cart)
    @cart_item_2 = FactoryGirl.create(:cart_item, :cart => @cart)
  }

  it "hi" do
    p @cart
  end

end