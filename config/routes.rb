Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 1 - I want a page with the list of all the products,
  # with buttons so that the user can add to cart
  resources :products, only: :index

  # 2 - When the user clicks on add to cart, I want to
  # create a CartProduct and a ShoppingCart if it doesn't exist
  # yet
  resources :cart_products, only: [:create, :destroy]

  # 3 - When the product is already on the shopping cart,
  # instead of the Add to Cart btn, I want a Remove from Cart btn

end
