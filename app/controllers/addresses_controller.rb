class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to order_show_path(current_user.orders.last.id)
    else
      render :action => 'new'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(address_params)
      redirect_to :back
    else
      render :action => 'edit'
    end
  end

  private

  def address_params
    params.fetch(:address,{}).permit(:user_id,:house_number,:street,:city,:state,:pincode,:phone_number)
  end
end
