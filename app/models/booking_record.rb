# == Schema Information
#
# Table name: booking_records
#
#  id           :integer          not null, primary key
#  begin_date   :datetime
#  end_date     :datetime
#  person_count :integer          default(1)
#  price        :integer
#  status       :integer          default("pending")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  room_id      :integer          not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_booking_records_on_room_id  (room_id)
#  index_booking_records_on_user_id  (user_id)
#
# Foreign Keys
#
#  room_id  (room_id => rooms.id)
#  user_id  (user_id => users.id)
#
class BookingRecord < ApplicationRecord
  belongs_to :room
  belongs_to :user

  scope :valid, -> { where("status < 2")}
  scope :invalid, -> { where("status >= 2") }

  # scope :begin_date, -> (date) { where("begin_date < ?", date) }
  # scope :end_date, -> (date) { where("end_date > ?", date) }

  # scope :includes_date_record_count, -> (date) { where("begin_date <= ? AND end_date > ?", date, date).size }
  scope :includes_date_record_count, -> (bingin_date, end_date) {
    where(
    "(begin_date < ? AND end_date > ?) OR
     (begin_date > ? AND end_date < ?) OR
     (begin_date < ? AND end_date > ?) OR
     (begin_date < ? AND end_date > ?)", 
    bingin_date, bingin_date, bingin_date, end_date, end_date, bingin_date, bingin_date, end_date).size }

  enum status: {
    pending: 0,
    reserving: 1,
    closed: 2,
    expired: 3,
    canceled: 4
  }

  def total_price
    booking_days * self.price
  end

  def booking_days
    (self.end_date.to_date - self.begin_date.to_date).to_i.abs
  end

end
