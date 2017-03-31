class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :description, presence: true, length: { maximum: 500,
    too_long: "%{count} characters is the maximum allowed" }

# name - presence - uniqueness
# price - presence - numericality
# description - presence - length of 500 characters

  def sale_message
    if "#{price}".to_i <= 1000
      then "Last minute price"
    else "Member price"
    end
  end

  # def price_class_name
  #   if sale_message == "Last minute price"
  #     "Last minute price"
  #   else 
  #     ""
  #   end
  # end

  def discounted?
    if price.to_f < 1000
    #   return true
    # else
    #   return false
    # end
    end
  end

  ###the above is meant to return red prices if dicounted , need to write logic in html - check peters gitub
        

  def tax
    "#{price}".to_i * 0.09 
  end

  def total
    "#{price}".to_i + tax
  end

  def subtotal
    "#{price}".to_i 
  end

 
  # def supplier
  #   Supplier.find_by(id: self.supplier.id)
  # end

    #makes alot of assumptions
 
end
