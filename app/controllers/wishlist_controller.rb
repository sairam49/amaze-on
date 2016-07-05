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
    #current_user.wishlist.products.each.reject! {|p| p[:id] == params[:product_id]}
    current_user.wishlist.products.delete(params[:product_id])
    products = current_user.wishlist.products
    #products.each do |p|
     # if p[:id] == params[:product_id]
      #p.delete(:id)
      #p.delete(:cost)
      #end
    current_user.wishlist.update_attribute(:products,products)
    redirect_to :action => 'list', notice: 'Product removed from wishlist!'
  end

  def list
    @products = Product.find(@wishlist.products.keys)
  end

  def destroy
    current_user.wishlist.destroy
    redirect_to :action => 'list', notice: 'Wishlist is destroyed!'
  end

  private
    def set_wishlist
      @wishlist = current_user.wishlist.present? ? current_user.wishlist : Wishlist.create(:user_id => current_user.id)
    end

    def build_products
      if params[:wishlist][:product_id].present?
        #@wishlist.products = {:id => params[:wishlist][:product_id],:cost => params[:wishlist][:product_cost]}
        ret = @wishlist.products
        ret[params[:wishlist][:product_id]] = {:cost => params[:wishlist][:product_cost]}
        @wishlist.products = ret
      end
      # {"p1" => {:cost => 20}}
    end
end
