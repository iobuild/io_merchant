class CartsController < ApplicationController


  def index
  end

  def remove_item
    cart_item = IoMerchant::ShoppingCart::CartItem.find(params[:id])
    @cart.remove_by_item(cart_item)


    render :template => "carts/_cart_items", :locals => {:cart => @cart}, :layout => false

  end


end