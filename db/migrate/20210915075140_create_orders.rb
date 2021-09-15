class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id, null:false
      t.string :shipping_postal_code, null:false
      t.text :shipping_address, null:false
      t.string :shipping_name, null:false
      t.integer :status, null:false
      t.integer :payment_method, null:false
      t.integer :total_price, null:false
      t.integer :delivery_price, null:false
      
      t.timestamps
    end
  end
end
