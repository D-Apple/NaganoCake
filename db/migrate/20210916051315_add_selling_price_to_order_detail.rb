class AddSellingPriceToOrderDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :selling_price, :integer
  end
end
