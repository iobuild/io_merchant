class OrdersController < ApplicationController

  before_filter :authenticate_user!, :check_address

  def check_address
    @buyer = Buyer.find(current_user.id)

    redirect_to "/addresses/new" if @buyer.has_no_address?
  end


  def add_product
    session[:shopping_product_id] = params[:product_id] if params[:product_id]
    @cart = @buyer.cart

    product = Product.find(session[:shopping_product_id])
    @cart.add(product)

    redirect_to '/orders'
  end



  def index
    @default_address = @buyer.default_address



    @cart = @buyer.cart
    @type = 'cart'
    if session[:shopping_product_id]
      @type = 'product'
      product = Product.find(session[:shopping_product_id])

      @cart_item = @cart.item_for(product)
      @product = @cart_item.sellable
      
    end

    
  end



end