class AddressesController < ApplicationController

  before_filter :authenticate_user!, :pre_load

  def pre_load
    @buyer = Buyer.find(current_user.id)
  end

  def load_data
    file = File.read(Rails.root.join('data', 'areas.json'))
    @areas = JSON.parse(file)
  end


  def address_params
    params.require(:io_merchant_address).permit(:province, :city, :sub_city, :street, :buyer)
  end

  def index
    @addresses = @buyer.addresses
  end


  def new
    load_data

    @address = IoMerchant::Address.new

    @provinces = @areas.keys

    # render :nothing => true
  end


  def get_cities
    load_data

    name = params[:name]

    # @areas[name].keys

    render :json => @areas[name].keys
  end


  def get_sub_cities
    load_data

    parent_name = params[:parent_name]
    name = params[:name]

    render :json => @areas[parent_name][name]
  end


  def create
    @address = @buyer.addresses.build(address_params)

    return redirect_to "/addresses" if @address.save

    render 'new'
  end



end