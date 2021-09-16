class AddProductIdToOrderDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :product_id, :integer
  end
end
