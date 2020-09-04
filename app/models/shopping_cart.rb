class ShoppingCart < ApplicationRecord

  STATUS = ["open", "closed", "canceled"]

  belongs_to :user
  has_many :cart_products, dependent: :destroy
  # the booking from Patrick

end
