require "spec_helper"
require "rails_helper"

describe OrderItem do

  it {should validate_presence_of(:order_id)}
  it {should validate_presence_of(:product_id)}
  it {should validate_presence_of(:unit_price)}
  it {should validate_presence_of(:quantity)}
  it {should validate_presence_of(:subtotal)}

  it {should belong_to(:order)}
  it {should belong_to(:seller)}

  describe "state" do

    before :each do
      @order_item = OrderItem.create()
    end

    it 'should be in initial state' do
      expect(@order_item).to have_state(:placed)
    end

    it 'should change to :shipped on :ship' do
      #@order_item.ship!
      expect(@order_item).to allow_event :ship
      expect(@order_item).to transition_from(:placed).to(:shipped).on_event(:ship)

    end

    it 'should change to :delivered on :deliver' do
      #@order_item.deliver!
      expect(@order_item).to transition_from(:shipped).to(:delivered).on_event(:deliver)
    end

    it 'should change to :cancelled on :cancel' do
      #@order_item.cancel
      expect(@order_item).to allow_event :cancel
      expect(@order_item).to transition_from(:placed,:shipped).to(:cancelled).on_event(:cancel)
    end

  end

end
