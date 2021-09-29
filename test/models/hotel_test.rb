# == Schema Information
#
# Table name: hotels
#
#  id            :integer          not null, primary key
#  code          :string
#  description   :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  hotel_type_id :integer          not null
#
# Indexes
#
#  index_hotels_on_hotel_type_id  (hotel_type_id)
#
# Foreign Keys
#
#  hotel_type_id  (hotel_type_id => hotel_types.id)
#
require 'test_helper'

class HotelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
