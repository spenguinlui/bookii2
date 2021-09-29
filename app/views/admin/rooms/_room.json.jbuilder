json.extract! room, :id, :room_number, :room_types, :price, :hotel_id, :created_at, :updated_at
json.url room_url(room, format: :json)
