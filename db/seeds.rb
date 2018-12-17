# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Restaurant.delete_all
Reservation.delete_all
MenuItem.delete_all


user1 = User.create!(name: "Malcolm", email: "a@b.c", loyalty_points: 0, password: "123")
user2 = User.create!(name: "dave", email: "q@w.e", loyalty_points: 0, password: "123")

restaurant1 = Restaurant.create!(name: "chez malcolm", capacity: 5, max_reservation_size: 2, price_range: 4, summary: "asfasdfasfa", user_id: 1, address: "asdfasdf", neighbourhood: "zxvczxcv", category: "chinese", mon_open_from: 8, mon_open_until: 19, tues_open_from: 8, tues_open_until: 19, wed_open_from: 8, wed_open_until: 19, thurs_open_until: 19, thurs_open_from: 8, fri_open_from: 8, fri_open_until: 19, sat_open_from: 8, sat_open_until: 19, sun_open_from: 8, sun_open_until: 19)
menu_item1 = MenuItem.create!(restaurant_id: 1, dish: "sandwich", price: 12)
reservation1 = Reservation.create!(user_id: 1, restaurant_id: 1, time: 6, date: Time.now + 1, party_size: 2)


menu_item2 = MenuItem.create!(restaurant_id: 2, dish: "XXXXXXXXXXXX", price: 88888888)
