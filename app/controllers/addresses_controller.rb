class AddressesController < ApplicationController

  before_action :authenticate_end_user!

  def index
    @address = Address.new
    @addresses = Address.where(end_user_id: current_end_user.id)
  end

  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    @address.save
    redirect_to request.referer
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to request.referer
  end


  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
