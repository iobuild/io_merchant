class HomeController < ApplicationController

  

  def index
  end


  def admin
  end


  def add_to_cart
    product = Product.find(params[:id])

    @cart.add(product)

    render :text => @cart.cart_items.length
  end


  def error_404
    render_404
  end




end