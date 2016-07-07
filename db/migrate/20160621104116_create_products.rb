class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :cost
      t.float :discount
      t.string :category
      t.string :gender
      t.integer :quantity
      t.text :tags
      t.integer :seller_id, index: true

      t.timestamps null: false
    end
  end
end
