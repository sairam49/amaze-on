class RatingsController < ApplicationController
 before_action :authenticate_user!
 before_filter :require_permission, :only => [:edit, :destroy]

  def require_permission
    if current_user != Rating.find(params[:id]).user
      redirect_to all_products_path
    end
  end


  def create
    if current_user.rating.present?
      redirect_to rating_edit_path(current_user.rating)
    else
		@product = Product.find(params[:product_id])
		@rating = @product.ratings.build(rating_params)
    if @rating.save
      redirect_to product_path(@product)
    else
      redirect_to request.referer
    end
	end
  end

  def edit
    @rating = Rating.find(params[:id])
    @url = request.referer
  end

  def update
    @rating = Rating.find(params[:id])
   if  @rating.update(rating_params)
     redirect_to params[:url]
   else
     render :action => 'edit'
   end
  end

  private

  def rating_params
    params.fetch(:rating, {}).permit(:user_id,:product_id,:rating,:review)
  end

end
