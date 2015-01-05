module ApplicationHelper

  def show_nav_active(controller, action)
    'active' if params[:action] == action && params[:controller] == controller
  end


  def extract_cart
    return unless current_user

    buyer = Buyer.find(current_user.id)
      
    @cart = buyer.cart

    return @cart if @cart

    IoMerchant::ShoppingCart::Cart.create(:buyer => buyer)

    # buyer.cart.create(:buyer => buyer)
    
  end

end
