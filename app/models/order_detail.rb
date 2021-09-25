class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum production_status: { 製作待ち: 0, 製作中: 1, 製作完了: 2, 着手不可: 3}
end
