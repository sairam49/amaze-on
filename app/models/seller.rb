class Seller < User
  has_many :products
  has_many :order_items
end
