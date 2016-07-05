class Wishlist < ActiveRecord::Base
  belongs_to :user
  serialize :products,Hash
end
