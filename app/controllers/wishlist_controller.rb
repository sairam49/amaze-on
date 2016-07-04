class WishlistController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wishlist
  before_action :build_products, only: [:create]

  def create
    if @wishlist.save
      redirect_to :action => 'list', notice: 'Product is added to wishlist!'
    end
  end

  def update
    current_user.wishlist.products.reject! {|p| p == params[:product_id]}
  end

  def list
    @products = Product.find(@wishlist.products.collect {|p| p[:id].to_i })
  end

  def destroy
    current_user.whishlist.destroy
    redirect_to :action => 'list', notice: 'Wishlist is destroyed!'
  end

  private
    def set_wishlist
      @wishlist = current_user.wishlist.present? ? current_user.wishlist : Wishlist.create(:user_id => current_user.id)
    end


    def build_products
      ret = []

      if params[:wishlist][:product_id].present?
        ret.push({:id => params[:wishlist][:product_id],:cost => params[:wishlist][:product_cost]})
        #params[:products].each do |k,v|
         #  ret.push({id: v[:id], price: v[:price]})
       end
      @wishlist.products << ret.first
    end
end
