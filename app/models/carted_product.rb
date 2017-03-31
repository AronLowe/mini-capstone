class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order, optional:true
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
end
