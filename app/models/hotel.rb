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
class Hotel < ApplicationRecord
  has_many :rooms
  belongs_to :hotel_type

  def enable_count
    rooms.count
  end

  def total_count
    rooms.count
  end
end
