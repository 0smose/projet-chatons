# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Item.destroy_all

20.times do 

	user = User.create!(
		email: Faker::Internet.email,
		password: Faker::Internet.password)

	item = Item.create!(
		title: Faker::Lorem.sentence,
		description: Faker::Lorem.paragraph_by_chars(152, false),
		price: rand(1..1000),
		image_url: Faker::LoremFlickr.image("200x300"))
end