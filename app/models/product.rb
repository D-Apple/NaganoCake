class Product < ApplicationRecord
  
  has_many :order_details, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  belongs_to :genre

  attachment :image
  
end
