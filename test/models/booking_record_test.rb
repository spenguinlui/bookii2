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
require 'test_helper'

class BookingRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
