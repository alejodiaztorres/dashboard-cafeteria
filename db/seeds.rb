# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all

Product.create(id: 1, name: 'Alejandro Valdéz', origin: 'Colombia', price: 5490)
Product.create(id: 2, name: 'Alejandro Valdéz 2', origin: 'Venezuela', price: 1990)
Product.create(id: 3, name: 'Alejandro Valdéz 3', origin: 'Perú', price: 2990)

product_prices = Product.pluck :id, :price

1000.times do

  quantity_random = rand(10..30)
  product_prices_random = product_prices.shuffle.first

  Sale.create(
    quantity: quantity_random,
    date_time: Faker::Date.between(from: '2017-01-01', to: Date.today),
    product_id:   product_prices_random[0],
    amount: (quantity_random * product_prices_random[1])
  )
end
