class CreateProductDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :product_details do |t|

      t.timestamps
    end
  end
end
