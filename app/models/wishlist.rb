class Wishlist < ActiveRecord::Base
  belongs_to :user
  #TODO: Drop product_id
  # Add product_ids, a serialized array attribute
  serialize :product_ids,Array
end
