require "spec_helper"

describe IoMerchant::ShoppingCart::Cart do
  before {
    @cart = FactoryGirl.create(:cart)
    @cart_item_1 = FactoryGirl.create(:cart_item, :amount => 1, :cart => @cart)
    @cart_item_2 = FactoryGirl.create(:cart_item, :amount => 2, :cart => @cart)
  }

  it 'cart_items length' do
    expect(@cart.cart_items.length).to eq(2)
  end

  it 'cart amount' do
    expect(@cart.amount).to eq(3)
  end





  describe 'empty cart' do

    before {
      @cart.clear
    }

    it 'cart_items length' do
      expect(@cart.cart_items.length).to eq(0)
    end

    it 'empty?' do
      expect(@cart.empty?).to eq(true)
    end

    it 'cart amount' do
      expect(@cart.amount).to eq(0)
    end

  end



  describe 'add product' do

    before {
      @product = products(:widget)
      @cart_new_item = @cart.add(@product, 2)
    }

    it 'cart_items length' do
      expect(@cart.cart_items.length).to eq(3)
    end

    it 'cart amount' do
      expect(@cart.amount).to eq(13)
    end

    it 'remove product' do
      @cart.remove_by_sellable(@product)
      @cart.reload

      expect(@cart.cart_items.length).to eq(3)
    end

    describe 'remove item1' do
      before {
        @cart.remove_by_item(@cart_item_1)
      }

      it 'cart length' do
        expect(@cart.cart_items.length).to eq(2)
      end

      it 'cart amount' do
        expect(@cart.amount).to eq(12)
      end
    end

    describe 'remove item2' do
      before {
        @cart.remove_by_item(@cart_new_item)
        @cart.reload
      }

      it 'cart amount' do
        expect(@cart.amount).to eq(3)
      end
    end


    describe 'update cart item quantity' do
      before {
        @cart.update_quantity_for(@product, 1)
      }

      it 'cart_items length' do
        expect(@cart.cart_items.length).to eq(3)
      end

      it 'cart amount' do
        expect(@cart.amount).to eq(8)
      end
    end


    describe 'update cart item amount' do
      before {
        @cart.update_amount_for(@product, 1)
      }

      it 'cart_items length' do
        expect(@cart.cart_items.length).to eq(3)
      end

      it 'cart amount' do
        expect(@cart.amount).to eq(4)
      end
    end


  end

  

end