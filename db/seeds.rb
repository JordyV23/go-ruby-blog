# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'dotenv'
Dotenv.load('.env')

username = ENV['USUARIO']
password = ENV['PASS']

puts password

user = User.where(email:"#{username}").first_or_initialize

user.update!(
    password: "#{password}",
    password_confirmation: "#{password}",
)