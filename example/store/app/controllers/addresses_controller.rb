class AddressesController < ApplicationController

  before_filter :pre_load

  def pre_load
    buyer = Buyer.find(current_user.id)
  end

  def index
  end


  def new
  end



end