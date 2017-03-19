class Product < ApplicationRecord

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

end
