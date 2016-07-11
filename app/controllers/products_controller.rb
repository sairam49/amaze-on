class ProductsController < ApplicationController
 before_action :authenticate_user!, :except => [:clothing,:sports,:garden,:home,:beauty,:show,:men,:women]
 before_filter :require_permission, :only => [:edit, :destroy]

  def require_permission
    if current_user != Product.find(params[:id]).seller
      redirect_to all_products_path
    end
  end

  def index
    @products = Product.all.where('quantity > 0')
   end

  def list
    @products = current_user.products
    # @products = Product.where(:seller_id => current_user.id).all
  end

   def show
      @product = Product.find(params[:id])
   end

   def search
     @products = Product.all
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC")
    else
      @products = Product.all.order("created_at DESC")
    end
   end

   def new
      @product = Product.new
   end

   def create
      @product = Product.new(product_params)
      if @product.save
         update = current_user.id
         @product.update_attribute(:seller_id,update)
         redirect_to :action => 'list'
      else
         render :action => 'new'
      end
   end

   def edit
      @product = Product.find(params[:id])
   end

   def update
      @product = Product.find(params[:id])
      if @product.update_attributes(product_params)
         redirect_to :action => 'show', :id => @product
      else
         render :action => 'edit'
      end
   end

   def destroy
      Product.find(params[:id]).destroy
      redirect_to :action => 'list'
   end

   def clothing
      @products = Product.where(:category => "Clothing").all
   end

   def sports
      @products = Product.where(:category => "Sports").all
   end

   def beauty
      @products = Product.where(:category => "Beauty").all
   end

   def home
      @products = Product.where(:category => "Home").all
   end

   def garden
      @products = Product.where(:category => "Garden").all
   end

   def men
      @products = Product.where(:gender => "Male").all
   end

   def women
      @products = Product.where(:gender => "Female").all
   end

  private

   def product_params
      params.fetch(:product, {}).permit(:name,:description,:cost,:discount,:category,:gender,:quantity,:tags,:image)
   end

end
