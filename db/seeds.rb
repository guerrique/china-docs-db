# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
# Doc.destroy_all
User.destroy_all

guerrique = User.create!(email: "guerrique@gmail.com", password: "guegue321!", admin: true)
puts "Finished!"
