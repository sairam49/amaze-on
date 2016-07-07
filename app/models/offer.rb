class Offer < ActiveRecord::Base
  mount_uploader :image , OfferUploader
end
