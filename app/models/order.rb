class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product, optional: true  #turns off the need for an id

  def calc_tax
    product.price * 0.09 * quantity
  end

  def calc_total
    (product.price * quantity) + calc_tax
  end

  def calc_subtotal
    product.price * quantity
  end

end
