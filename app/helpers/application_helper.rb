module ApplicationHelper

  def current_order
    Order.create(user_id: current_user.id)
  end


end
