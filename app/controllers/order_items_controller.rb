class OrderItemsController < ApplicationController
  helper_method :product_name,:find_image_url,:find_discount
  before_action :set_order_item , only: [:cancel_order_item,:ship_order_item,:deliver_order_item]

  def create
      Order.transaction do
        @order =  Order.create(user_id: current_user.id)
        cart = session[:_cart]
          cart.each do |k,v|
            @row = Product.find(k.to_i)
            @order_item = OrderItem.new(:order_id => @order.id,:seller_id => @row.seller_id,:product_id => k.to_i,:unit_price => @row.cost,:quantity => v.to_i,:subtotal => (@row.cost.to_i*v.to_i))
            @order_item.save
          end
        session.delete(:_cart)
     end
       @order_items = @order.order_items
       @user = current_user
       OrderMailer.delay.order_confirmation(@user,@order,@order_items)
     if current_user.addresses.present?.!
        redirect_to addresses_new_path
     else
        redirect_to :action => 'show',:id => @order.id
     end
   end


  def show
    order = current_user.orders.last
    order_id = order.id
    @order_items = Order.find(order_id).order_items
    @address = current_user.addresses.first
  end


  def received_orders
    @received_orders = current_user.order_items
  end

  def placed_orders
     @orders = {}
    placed_order_ids = current_user.orders.ids
    placed_order_ids.each do |pid|
      @orders[pid] = Order.find(pid).order_items
    end
  end


  def cancel_order_item
    @order_item.cancel!
    redirect_to :back
  end


  def ship_order_item
    @order_item.ship!
    redirect_to :back
  end


  def deliver_order_item
    @order_item.deliver!
    redirect_to :back
  end


  def product_name(id)
    Product.find(id).name
  end


  def find_image_url(id)
    Product.find(id).image_url
  end


  def find_discount(id)
    Product.find(id).discount
  end

  private

  def set_order_item
   @order_item = OrderItem.find(params[:id])
  end

end

