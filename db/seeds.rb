# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# ************************ We destroy our users and our items ************************  

User.destroy_all
Item.destroy_all

# ---------------------------- We create our users and our items ---------------------------- #
20.times do 

	user = User.create!(
		email: Faker::Internet.email,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: Faker::Internet.password)

	item = Item.create!(
		title: Faker::Lorem.sentence,
		description: Faker::Lorem.paragraph_by_chars(152, false),
		price: rand(1..1000),
		image_url: ["https://images.unsplash.com/photo-1494256997604-768d1f608cac?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1401&q=80", "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1466618786657-4df462be674e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1513780043732-614405263485?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1471874276752-65e2d717604a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://pbs.twimg.com/media/DLk1g-CVwAAaIFh.jpg"].sample)

	# Puts to show every time an item is added
	puts "Item added"
end

# We create an admin
user = User.create!(
		email: "johnneige@yopmail.com",
		first_name: "John",
		last_name: "Neige",
		password: "dumdum",
		is_admin: true)

puts "-----------------------------"
puts "------- Admin created! ------"
puts "-----------------------------"

puts "Access to the admin account :"
puts "Login: johnneige@yopmail.com"
puts "Password: dumdum"
puts "-----------------------------"