class Search
  include ActiveModel::Model

  attr_accessor :begin_date, :end_date, :person_count, :room_type

  validates :begin_date, :end_date, :person_count, :room_type, presence: true

  def perform(query)
    begin_date = query[:begin_date]
    end_date = query[:end_date]
    room_type = query[:room_type]
    no_record_room = Room.room_type_for(room_type).excluding(Room.have_booking_records)
    vacancy_room = Room.room_type_for(room_type).have_booking_records.excluding(Room.room_type_for(room_type).includes_date_record_rooms(begin_date, end_date))
    no_record_room = vacancy_room.length > 0 ?  no_record_room << vacancy_room : no_record_room
  end
end