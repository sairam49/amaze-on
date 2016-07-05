FactoryGirl.define do
  factory :order_item do
    state "placed"
    order_id "10"
    product_id "2"
    unit_price "1000"
    quantity "1"
    subtotal "1000"
  end
end
