require "spec_helper"

describe IoMerchant::ShoppingCart::Cart do
  before {
    @cart = FactoryGirl.create(:cart)
    @cart_item_1 = FactoryGirl.create(:cart_item, :cart => @cart)
    @cart_item_2 = FactoryGirl.create(:cart_item, :cart => @cart)
  }

  it 'cart_items length' do
    expect(@cart.cart_items.length).to eq(2)
  end

  it "hi" do
    product = products(:widget)
    @cart.add product

    expect(@cart.cart_items.length).to eq(3)
  end

end