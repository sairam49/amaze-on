class CartsController < ApplicationController
   def show
    @order_items = []

    cart = session[:_cart] ? session[:_cart] : {}
    cart.each do |k,v|
      @row = Product.find(k.to_i)
      @order_items << {product_id: k.to_i, quantity: v.to_i,product_name:@row.name,
                       unit_price: @row.cost, total_price: (@row.cost.to_i*v.to_i),img_url: @row.image_url.to_s}

    end
  end

  def add_item
    item_id  = params[:item][:id]
    item_qty = params[:item][:quantity].to_i

    if item_qty > 0
      cart = session[:_cart] ? session[:_cart] : {}
      cart[item_id] = item_qty
      session[:_cart] = cart
    end
    redirect_to cart_path, notice: "Added to cart successfully!"
  end


  def update_item
    session[:_cart][params[:product_id]] = params[:quantity]

    redirect_to cart_path, notice: "Updated the cart item successfully!"
  end


  def remove_item
    cart = session[:_cart]
    cart.reject! {|k,v| k == params[:product_id] }
    session[:_cart] = cart

    redirect_to cart_path, notice: "Removed the item from cart successfully!"
  end

end
