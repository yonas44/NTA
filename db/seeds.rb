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

client_user1 = FactoryBot.create(:user, role: 'client', name: 'Tesfu', password: 'password')
client_profile1 = FactoryBot.create(:client, user: client_user, profile_pic: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCp_ByMCZW8m0s3KmAbIENDvR2Zc_HkBJyYw&usqp=CAU')
client_user2 = FactoryBot.create(:user, role: 'client', name: 'Selam', password: 'password')
client_profile2 = FactoryBot.create(:client, user: client_user, profile_pic: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRplemEtGrHCxGUTITR_64HFTrqnNsSkwfOmw&usqp=CAU', nutritionist_id: 1)
client_user3 = FactoryBot.create(:user, role: 'client', name: 'Kate', password: 'password')
client_profile3 = FactoryBot.create(:client, user: client_user, profile_pic: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW1p196FdFnjs53-qod0Iv6TbQwPWf3M4yZTRbJHH9KQ&s', nutritionist_id: 1)