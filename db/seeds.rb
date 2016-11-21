# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do 
  product = Product.new
  product.name = Faker::Commerce.product_name
  product.price = Faker::Commerce.price
  product.save

  100.times do 
    purchase = product.purchases.new
    purchase.purchased_on = Faker::Date.between(1.month.ago, Date.today)
    purchase.purchased_price = product.price * (1 + (([true, false].sample ? -1 : 1) * rand(10)/100))
    purchase.save
  end
end
