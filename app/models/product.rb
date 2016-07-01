class Product < ActiveRecord::Base
  belongs_to :seller
  has_many :ratings
  mount_uploader :image, ImageUploader

  validates :name,presence: true,length: { maximum: 15}
  validates :description,presence: true,length: {maximum: 300}
  validates :cost,:discount,:quantity,presence: true
  validates :tags,presence: true
  validates_numericality_of :cost,:quantity,:greater_than => 0

  def self.search(search)
  where("name LIKE ? OR tags LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
