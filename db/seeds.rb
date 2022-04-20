# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


categories = Category.create([{ name: "Main Course" }, { name: "Baverages" }])
Menu.create(name: "Nasi Goreng", description: "Nasi digoreng dengan bumbu", price: 10000.0, category: categories.first)