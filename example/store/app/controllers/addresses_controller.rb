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
    load_data
    @new_address = IoMerchant::Address.new
    @provinces = @areas.keys


    @addresses = @buyer.addresses

    redirect_to '/addresses/new' if @addresses.length == 0

    @default_address = @buyer.default_address
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
    @buyer.set_unique_default(@address)

    return redirect_to "/addresses" if @address.save

    render 'new'
  end


  def select_default
    address_id = params[:address_id]
    address = @buyer.addresses.find(address_id)
    p address
    p '===='
    @buyer.set_unique_default(address)

    p @buyer.default_address
    p '-----'

    redirect_to '/addresses'
    # render :nothing => true

  end



end