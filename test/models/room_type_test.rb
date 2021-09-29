# == Schema Information
#
# Table name: room_types
#
#  id                   :integer          not null, primary key
#  person_default_count :integer
#  type_name            :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
require 'test_helper'

class RoomTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
