class WelcomeController < ApplicationController
  def index
   @latest_beauty_products = Product.where(:category => "Beauty").last(3).reverse
   @latest_sports_products = Product.where(:category => "Sports").last(3).reverse
   @latest_garden_products = Product.where(:category => "Garden").last(3).reverse
   @latest_home_products = Product.where(:category => "Home").last(3).reverse
   @latest_clothing_products = Product.where(:category => "Clothing").last(3).reverse
   @latest_offers = Offer.last(3).reverse
  end
end
