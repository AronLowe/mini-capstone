class Supplier < ApplicationRecord
  # def products
  #   Product.where(supplier_id: self.id)
  # end
  has_many :products

  #makes alot of 
end
