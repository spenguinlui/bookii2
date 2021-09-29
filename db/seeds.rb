# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'spenguin10@gmail.com', name: '水手A', password: 'xxxzzz', password_confirmation: 'xxxzzz')
User.create(email: 'spenguin100@gmail.com', name: '水手B', password: 'xxxzzz', password_confirmation: 'xxxzzz')
User.create(email: 'sssssss@cccc.xx', name: '野兔', password: 'xxxzzz', password_confirmation: 'xxxzzz')
User.create(email: 'aaaaa@bbb.cc', name: '祭絲', password: 'xxxzzz', password_confirmation: 'xxxzzz')

Admin.create(email: 'spenguin10@gmail.com', password: 'xxxzzz', password_confirmation: 'xxxzzz')

hotel = HotelType.create(type_name: 'hotel')
HotelType.create(type_name: 'hostel')
guest_house = HotelType.create(type_name: 'guest_house')
inn = HotelType.create(type_name: 'inn')
motel = HotelType.create(type_name: 'motel')
rental = HotelType.create(type_name: 'rental')
HotelType.create(type_name: 'resort')
ryokan = HotelType.create(type_name: 'ryokan')

single = RoomType.create(type_name: 'single', person_default_count: 1)
double = RoomType.create(type_name: 'double', person_default_count: 2)
twin = RoomType.create(type_name: 'twin', person_default_count: 2)
triple = RoomType.create(type_name: 'triple', person_default_count: 3)

lion_hotel = Hotel.create(name: '獅子旅社', hotel_type_id: hotel.id, code: 'lion446', description: '這是一間獅子旅行社，吼吼吼~~~')
pakora_hotel = Hotel.create(name: '兔兔 MO', hotel_type_id: motel.id, code: 'pakora333', description: 'pako，pako，HAHAHAHA')
fubuki_hotel = Hotel.create(name: '狐狸出租屋', hotel_type_id: rental.id, code: 'fubuki111', description: '空房兩間出租，房東在旁邊打lol')
marine_hotel = Hotel.create(name: '寶鐘海賊團聚點', hotel_type_id: inn.id, code: 'marine333', description: 'Ahoy~! 水手喝酒囉!')
paradise_hotel = Hotel.create(name: '狗狗民宿', hotel_type_id: guest_house.id, code: 'paradise22', description: '鄉間小民宿，汪汪')
duck_hotel = Hotel.create(name: '大空鴨子屋', hotel_type_id: ryokan.id, code: 'duck486', description: '鴨肉料理的日式料理管')

(1..50).map do |number|
  if (number < 10)
    Room.create(room_number: "L0#{number.to_s}", room_type_id: single.id, person_count: single.person_default_count, price: 200, hotel_id: lion_hotel.id)
  elsif (number < 20 && number >= 10)
    Room.create(room_number: "L#{number.to_s}", room_type_id: single.id, person_count: single.person_default_count, price: 200, hotel_id: lion_hotel.id)
  elsif (number < 40 && number >= 20)
    Room.create(room_number: "L#{number.to_s}", room_type_id: double.id, person_count: double.person_default_count, price: 300, hotel_id: lion_hotel.id)
  elsif (number <= 45 && number >= 40)
    Room.create(room_number: "L#{number.to_s}", room_type_id: twin.id, person_count: twin.person_default_count, price: 400, hotel_id: lion_hotel.id)
  elsif  (number <= 50 && number > 45)
    Room.create(room_number: "L#{number.to_s}", room_type_id: triple.id, person_count: triple.person_default_count, price: 500, hotel_id: lion_hotel.id)
  end
end

(1..20).map do |number|
  if (number < 10)
    Room.create(room_number: "P0#{number.to_s}", room_type_id: double.id, person_count: double.person_default_count, price: 450, hotel_id: pakora_hotel.id)
  elsif (number <= 20 && number >= 10)
    Room.create(room_number: "P#{number.to_s}", room_type_id: double.id, person_count: double.person_default_count, price: 450, hotel_id: pakora_hotel.id)
  end
end

Room.create(room_number: "F01", room_type_id: twin.id, person_count: twin.person_default_count, price: 300, hotel_id: fubuki_hotel.id)
Room.create(room_number: "F02", room_type_id: triple.id, person_count: triple.person_default_count, price: 400, hotel_id: fubuki_hotel.id)

(1..5).map do |number|
  if (number < 3)
    Room.create(room_number: "M0#{number}", room_type_id: single.id, person_count: single.person_default_count, price: 100, hotel_id: marine_hotel.id)
  else
    Room.create(room_number: "M0#{number}", room_type_id: double.id, person_count: double.person_default_count, price: 150, hotel_id: marine_hotel.id)
  end
end

(1..15).map do |number|
  if (number < 10)
    Room.create(room_number: "D0#{number}", room_type_id: double.id, person_count: double.person_default_count, price: 500, hotel_id: paradise_hotel.id)
  else
    Room.create(room_number: "D#{number}", room_type_id: twin.id, person_count: twin.person_default_count, price: 600, hotel_id: paradise_hotel.id)
  end
end

(1..10).map do |number|
  if (number < 7)
    Room.create(room_number: "S0#{number}", room_type_id: double.id, person_count: double.person_default_count, price: 600, hotel_id: duck_hotel.id)
  elsif (number >= 7 && number < 10)
    Room.create(room_number: "S0#{number}", room_type_id: twin.id, person_count: twin.person_default_count, price: 800, hotel_id: duck_hotel.id)
  else
    Room.create(room_number: "S#{number}", room_type_id: triple.id, person_count: triple.person_default_count, price: 1000, hotel_id: duck_hotel.id)
  end
end