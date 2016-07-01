class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.float :unit_price
      t.integer :quantity
      t.float :subtotal

      t.timestamps null: false
    end
  end
end
