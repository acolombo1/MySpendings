# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom')
second_user = User.create(name: 'Lilly')

Category.create(name: 'Fruits & Vegetables', author: first_user, icon: '/app/assets/images/fruits_vegetables.png')
Category.create(name: 'Restaurant', author: first_user, icon: '/app/assets/images/restaurant.png')
Category.create(name: 'Income', author: first_user, icon: '/app/assets/images/income.png')
Movement.create(name: 'Mc Donalds', amount: 17.6, author: first_user)
