# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Deleting reservations"
Reservation.destroy_all

puts "Deleting offers"
Offer.destroy_all

puts "Deleting users"
User.destroy_all

puts "Creating offers"

user1 = User.create!(email: "clariursini@gmail.com", password: "123456", full_name: "Clara Ursini")
user2 = User.create!(email: "valenursini@gmail.com", password: "123456", full_name: "Valen Ursini")

puts "Done"

puts "Creating offers"

offer1 = Offer.new(user: user1, title: "Quinta en Pilar", description: "Muy lindo con mucho pasto y lugar para correr", location: "Pilar, Buenos Aires", price_per_night: 2000)

photos_offer1 = [URI.open("https://images.unsplash.com/photo-1530178338825-ceb89d377f11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"), URI.open("https://images.unsplash.com/photo-1529122316052-65f6954b9c83?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")]

photos_offer1.each do |photo|
  offer1.photos.attach(io: photo, filename: "offer1.png", content_type: "image/png")
end

offer1.save!

offer2 = Offer.new(user: user2, title: "Hermosa casa en Escobar", description: "Super estadia en Escobar para tu mascota", location: "Escobar, Buenos Aires", price_per_night: 3000)
photos_offer2 = [URI.open("https://images.unsplash.com/photo-1501183638710-841dd1904471?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"), URI.open("https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")]

photos_offer2.each do |photo|
  offer2.photos.attach(io: photo, filename: "offer2.png", content_type: "image/png")
end

offer2.save!

offer3 = Offer.new(user: user2, title: "Casa con patio", description: "Hermosa casa con amplio patio, cuido a tu mascota", location: "Caballito, Buenos Aires", price_per_night: 1500)
photos_offer3 = [URI.open("https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=658&q=80"), URI.open("https://images.unsplash.com/photo-1480074568708-e7b720bb3f09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80")]

photos_offer3.each do |photo|
  offer3.photos.attach(io: photo, filename: "offer3.png", content_type: "image/png")
end

offer3.save!

puts "Done"

puts "Creating reservations"

Reservation.create!(offer: offer1, user: user2, date_checkin: Date.parse('2022-10-03'), date_checkout: Date.parse('2022-10-10'), guests: 2, confirmed: false)
Reservation.create!(offer: offer2, user: user1, date_checkin: Date.parse('2022-9-10'), date_checkout: Date.parse('2022-9-20'), guests: 1, confirmed: true)
Reservation.create!(offer: offer3, user: user1, date_checkin: Date.parse('2022-12-03'), date_checkout: Date.parse('2022-12-10'), guests: 3, confirmed: false)

puts "Done"
