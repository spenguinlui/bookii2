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
class RoomType < ApplicationRecord
  has_many :rooms

  enum room_types: {
    single: '單人房',
    double: '單床雙人房',
    twin: '雙床雙人房',
    triple: '三人房'
  }

  def room_type_zh
    RoomType.room_types[self.type_name]
  end
end
