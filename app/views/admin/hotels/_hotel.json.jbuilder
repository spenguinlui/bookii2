json.extract! hotel, :id, :name, :hotel_type, :code, :total_count, :description, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
