class AddProductsToWishlist < ActiveRecord::Migration
  def change
    add_column :wishlists, :products, :text
  end
end
