class Product < ApplicationRecord

  belongs_to :user
  has_many :cart_products, dependent: :nullify

  # has_many :shopping_carts, through: :cart_products
  # the line is correct, but we are not gonna use it!

  def is_it_in_the_shopping_cart?(user)
    cart = user.shopping_carts.find_by(status: 'open')

    if cart
      CartProduct.find_by(shopping_cart: cart, product: self).present?
    else
      false
    end
  end

  def cart_product(user)
    cart = user.shopping_carts.find_by(status: 'open')

    if cart
      CartProduct.find_by(shopping_cart: cart, product: self)
    else
      nil
    end
  end


end
