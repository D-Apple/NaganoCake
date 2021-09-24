class Product < ApplicationRecord
  
  has_many :order_details, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  belongs_to :genre

  attachment :image
  
  def add_tax_price
    (self.price * 1.1).round
  end
end
