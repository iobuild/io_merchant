module ApplicationHelper

  def show_nav_active(controller, action)
    'active' if params[:action] == action && params[:controller] == controller
  end


  def extract_cart
    return unless current_user

    buyer = Buyer.find(current_user.id)
      
    @cart = buyer.cart

    p @cart
    p '===='

    return @cart if @cart

    p buyer.cart.create(:buyer => buyer)
    p '======'
    
  end

end
