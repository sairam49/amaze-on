class Address < ActiveRecord::Base
  belongs_to :user
  validates :house_number,:street,:city,:state,:pincode,:phone_number,presence: true
  validates :phone_number, length: {maximum: 12}

end
