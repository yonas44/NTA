# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
FactoryBot.create(:meal_type, name: 'Breakfast')
FactoryBot.create(:meal_type, name: 'Lunch')
FactoryBot.create(:meal_type, name: 'Dinner')

nutritionist = Nutritionist.first

incredient1 = Ingredient.create(nutritionist: nutritionist, name: 'Egg', picture: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfiO7agvs5Xg3uKg-u0FIahDpYwib8Fj6giA&usqp=CAU')
incredient2 = Ingredient.create(nutritionist: nutritionist, name: 'Makroni', picture: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNR2XMKk4sScqnm2Ua5sWPlU-p0GKWoWN50PEe4oWG7HxeMU7TD4_55Zw0HAA9-9VPb4M&usqp=CAU')
incredient3 = Ingredient.create(nutritionist: nutritionist, name: 'Flour', picture: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRjHMpdYBbNcWSSqRjUJ2Jt9RhoLtnVThjqQ&usqp=CAU')
incredient4 = Ingredient.create(nutritionist: nutritionist, name: 'Beef', picture: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9f8RGGkXFtNSsY44yrzp5DgtNtYxoIX2H-A&usqp=CAU')