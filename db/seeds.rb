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
		image_url: ["https://unsplash.com/photos/NodtnCsLdTE", "https://unsplash.com/photos/IbPxGLgJiMI", "https://unsplash.com/photos/O7ePLfRRlBs", "https://unsplash.com/photos/AL2-t0GrSko", "https://unsplash.com/photos/_yL3CxNwV4M", "https://images.ecosia.org/q4sawnP1MoScnUvWWFwGPfFgHAs=/0x390/smart/http%3A%2F%2Faz616578.vo.msecnd.net%2Ffiles%2F2016%2F05%2F19%2F635992707959380360-1327033223_08-grumpy-cat.w1200.h630.jpg"].sample
end