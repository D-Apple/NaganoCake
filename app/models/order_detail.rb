class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
  enum production_status: { 制作待ち: 0, 製作中: 1, 制作完了: 2, 着手不可: 3}
end
