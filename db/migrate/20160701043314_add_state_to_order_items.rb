class AddStateToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :state, :string, :default => "placed"
  end
end
