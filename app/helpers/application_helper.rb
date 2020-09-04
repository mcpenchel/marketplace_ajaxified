module ApplicationHelper

  def formatted_price(price)
    "R$ #{price / 100.0}"
  end

end
