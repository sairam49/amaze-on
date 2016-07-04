class RemoveProductIdsFromWishlist < ActiveRecord::Migration
  def change
    remove_column :wishlists, :product_ids, :text
  end
end
