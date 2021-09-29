# == Schema Information
#
# Table name: rooms
#
#  id           :integer          not null, primary key
#  person_count :integer
#  price        :integer
#  room_number  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  hotel_id     :integer          not null
#  room_type_id :integer          not null
#
# Indexes
#
#  index_rooms_on_hotel_id      (hotel_id)
#  index_rooms_on_room_type_id  (room_type_id)
#
# Foreign Keys
#
#  hotel_id      (hotel_id => hotels.id)
#  room_type_id  (room_type_id => room_types.id)
#
class Room < ApplicationRecord
  belongs_to :hotel
  belongs_to :room_type
  has_many :booking_records

  # 符合房間類型的房間
  scope :room_type_for, -> (query) { joins(:room_type).where("room_types.type_name = ?", query).references(:room_type) }

  # 有預約記錄的房間
  scope :have_booking_records, -> { includes(:booking_records).where("booking_records.room_id IS NOT NULL").references(:booking_records) }

  # 有效預約單
  scope :valid_booking_records, -> { joins(:booking_records).where("booking_records.status <= 1").references(:booking_records) }

  # 該日期已有 on單預約記錄的房間
  scope :includes_date_record_rooms, -> (begin_date, end_date) {
    includes(:booking_records)
    .where("booking_records.status <= 1")
    .where("
      (booking_records.begin_date < ? AND booking_records.end_date > ?) OR
      (booking_records.begin_date > ? AND booking_records.end_date < ?) OR
      (booking_records.begin_date < ? AND booking_records.end_date > ?) OR
      (booking_records.begin_date < ? AND booking_records.end_date > ?)", 
      begin_date, begin_date, begin_date, end_date, end_date, begin_date, begin_date, end_date)
    .references(:booking_records)
  }

  def room_is_enough? person_count
    self.person_count >= person_count
  end

  def reservation_number
    false # 待改
  end

  # 確認該房間日期是否留空
  def check_date_is_enable date
    self.booking_records.valid.includes_date_record_count(date) == 0
  end

  def is_enable_to_booking_rooms date
    Room.all.excluding(Room.have_booking_records) << Room.have_booking_records.excluding(Room.includes_date_record_rooms(Time.now - 1.days, Time.now - 3.days))
  end
end
