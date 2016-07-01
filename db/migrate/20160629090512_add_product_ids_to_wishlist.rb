class AddProductIdsToWishlist < ActiveRecord::Migration
  def change
    add_column :wishlists, :product_ids, :text
  end
end
