class OrderItem < ActiveRecord::Base
  include AASM

  belongs_to :order
  belongs_to :seller

  validates :order_id, presence: true
  validates :product_id, presence: true
  validates :unit_price, presence: true
  validates :quantity, presence: true
  validates :subtotal, presence: true

  aasm column: 'state' do
    state :placed, :initial => true
    state :shipped
    state :delivered
    state :cancelled

    event :ship do
      transitions :from => :placed, :to => :shipped
    end

    event :deliver do
      transitions :from => :shipped, :to => :delivered
    end

    event :cancel do
      transitions :from => [:placed, :shipped], :to => :cancelled
    end

  end
end

