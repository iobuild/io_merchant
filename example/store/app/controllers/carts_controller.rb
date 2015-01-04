class CartsController < ApplicationController


  def index
  end

  def remove_item
    cart_item = IoMerchant::ShoppingCart::CartItem.find(params[:id])
    @cart.remove_by_item(cart_item)

    render :template => "carts/_cart_items", :locals => {:cart => @cart}, :layout => false
  end


  def increase_quantity
    cart_item = IoMerchant::ShoppingCart::CartItem.find(params[:id])
    cart_item.update_quantity(params[:new_quantity])

    render :nothing => true
  end

  def decrease_quantity
    cart_item = IoMerchant::ShoppingCart::CartItem.find(params[:id])
    cart_item.update_quantity(params[:new_quantity])

    render :nothing => true
  end


end