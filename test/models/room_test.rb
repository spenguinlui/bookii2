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
require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
