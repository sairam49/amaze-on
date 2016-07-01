class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :house_number
      t.text :street
      t.string :city
      t.string :state
      t.text :pincode
      t.text :phone_number
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
