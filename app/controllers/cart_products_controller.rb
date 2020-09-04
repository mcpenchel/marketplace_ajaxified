class CartProductsController < ApplicationController

  def create
    shopping_cart = current_user.shopping_carts.find_or_create_by(
      status: 'open'
    )

    product = Product.find(params[:product_id])

    cart_product = CartProduct.new
    cart_product.shopping_cart = shopping_cart
    cart_product.product       = product
    cart_product.price         = product.price

    if cart_product.save
      redirect_to products_path
    end
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy

    redirect_to products_path
  end

end
