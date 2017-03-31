class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product, optional: true  #turns off the need for an id
  has_many :carted_products
  has_many :products, through: :carted_products

  

  def calc_tax
    product.price * 0.09 * quantity
  end

  def calc_total
    (product.price * quantity) + calc_tax
  end

  def calc_subtotal
    product.price * quantity
  end

  def order_name
    product.name
  end

  def order_image
    product.images[0].url
  end

  def order_product_id
    product.id
  end

end
