seller = User.create!(
  email: "ash.ketchun@gmail.com",
  password: "ilovebulbasaur"
)

Product.create!(name: "Pikachu Doll", price: 2000, user: seller)
Product.create!(name: "Charmander Lighter", price: 1000, user: seller)
Product.create!(name: "Bulba Spray", price: 1500, user: seller)
