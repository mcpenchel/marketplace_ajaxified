class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
  has_many :shopping_carts, dependent: :nullify
  # dependent: :nullify instead of deleting the shopping cart
  # will just set the user_id to nil

end
