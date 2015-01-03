module ApplicationHelper

  def show_nav_active(controller, action)
    'active' if params[:action] == action && params[:controller] == controller
  end


  def extract_shopping_cart
    cart_id = session[:cart_id]

    begin
      @cart = IoMerchant::ShoppingCart::Cart.find(cart_id)
    rescue
      @cart = IoMerchant::ShoppingCart::Cart.create
    end
    
    session[:cart_id] = @cart.id
  end

  def show_cart_number
    @cart.cart_items.length
  end

end
