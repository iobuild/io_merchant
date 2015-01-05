class OrdersController < ApplicationController

  before_filter :authenticate_user!, :check_address

  def check_address
    buyer = Buyer.find(current_user.id)

    redirect_to "/addresses/new" if buyer.addresses.length == 0
  end

  def index
    
  end



end