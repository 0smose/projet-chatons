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
		password: Faker::Internet.password)

	item = Item.create!(
		title: Faker::Lorem.sentence,
		description: Faker::Lorem.paragraph_by_chars(152, false),
		price: rand(1..1000),
		image_url: ["https://unsplash.com/photos/NodtnCsLdTE", "https://unsplash.com/photos/IbPxGLgJiMI", "https://unsplash.com/photos/O7ePLfRRlBs", "https://unsplash.com/photos/AL2-t0GrSko", "https://unsplash.com/photos/_yL3CxNwV4M", "https://pbs.twimg.com/media/DLk1g-CVwAAaIFh.jpg"].sample)
end