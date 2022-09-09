# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', email: 'tomsmail@yahoo.com')
second_user = User.create(name: 'Lilly', email: 'lilly@yahoo.com')
first_user.password = '123456'
first_user.password_confirmation = '123456'
first_user.confirm
second_user.password = '123456'
second_user.password_confirmation = '123456'
second_user.confirm

cat1 = Category.create(name: 'Fruits & Vegetables', author: first_user, icon: 'fruits_vegetables.png')
cat2 = Category.create(name: 'Restaurant', author: first_user, icon: 'restaurant.png')
cat3 = Category.create(name: 'Income', author: first_user, icon: 'income.png')
mov1 = Movement.create(name: 'Mc Donalds', amount: 17.6, author: first_user)
mov2 = Movement.create(name: 'Siga la Vaca', amount: 30.5, author: first_user)
CategoryMovement.create(category: cat2, movement: mov1, author: first_user)
CategoryMovement.create(category: cat2, movement: mov2, author: first_user)
mov3 = Movement.create(name: 'Mc Donalds', amount: 12.85, author: second_user)
cat4 = Category.create(name: 'Restaurant', author: second_user, icon: 'restaurant.png')
CategoryMovement.create(category: cat4, movement: mov3, author: second_user)
