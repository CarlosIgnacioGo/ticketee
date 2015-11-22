# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


unless User.exists?(email: "admin@ticketee.com")
  User.create!(email: "admin@ticketee.com", password: "12345678", admin: true) 
end

unless User.exists?(email: "user@ticketee.com")
  User.create!(email: "user@ticketee.com", password: "12345678", admin: false)
end

["Soy el projecto 1", "Soy el projecto 2"].each do |i|
  Project.create!(name: i, description: "Hola bienvenido al porjecto #{i}")
end

