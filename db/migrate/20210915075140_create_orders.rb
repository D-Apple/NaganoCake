class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id, null:false
      t.string :shipping_postal_code, null:false
      t.text :shipping_address, null:false
      t.string :shipping_name, null:false
      t.integer :status, null:false, default:0
      t.integer :payment_method, null:false, default:0
      t.integer :total_price, null:false
      t.integer :delivery_price, null:false, default:800
      t.timestamps
    end
  end
end
