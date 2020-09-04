class CartProductsController < ApplicationController

  def create
    shopping_cart = current_user.shopping_carts.find_or_create_by(
      status: 'open'
    )

    @product = Product.find(params[:product_id])

    @cart_product = CartProduct.new
    @cart_product.shopping_cart = shopping_cart
    @cart_product.product       = @product
    @cart_product.price         = @product.price

    # this works because of the name of the file
    # and because I'm not using redirect_to, so I'm basically
    # telling Rails to not use turbolinks to reload the page
    # without refreshing it
    @cart_product.save

    render json: { cart_product: @cart_product }
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    @product = cart_product.product

    cart_product.destroy
  end

end
