class WishlistController < ApplicationController
  before_action :authenticate_user!

  def create
    @wishlist = Wishlist.new
    @wishlist.user_id = params[:wishlist][:user_id]
    @wishlist.product_ids << params[:wishlist][:product_ids]
    if @wishlist.save
      redirect_to :action => 'list'
    end
  end

  def list
    @products = []
    # TODO: Fix this action logic
    @wishlist = current_user.wishlist.product_ids
    @wishlist.each do |w|
      product = Product.where(:id => w)
      @products.push(product)
    end
  end

  def destroy
    #TODO: You should only destroy the current user wishlist
     #if current_user.whishlist.id == params[:id]
      Wishlist.find(params[:id]).destroy
      redirect_to :action => 'list'
  end

  private
    def wishlist_params
      params.fetch(:wishlist, {}).permit(:user_id,:product_ids => [])
    end
end
