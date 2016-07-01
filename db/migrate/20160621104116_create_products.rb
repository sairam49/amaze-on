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
      t.references :seller, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
