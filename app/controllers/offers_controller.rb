class OffersController < ApplicationController
  before_action :authenticate_user!
  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def list
    @offers = Offer.all
  end

  private

  def offer_params
    params.require(:offers).permit(:image)
  end
end
