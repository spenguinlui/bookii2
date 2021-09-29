# == Schema Information
#
# Table name: hotel_types
#
#  id         :integer          not null, primary key
#  type_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class HotelType < ApplicationRecord
  has_many :hotels

  enum hotel_types: {
    hotel: '一般旅館',
    hostel: '青年旅館',
    guest_house: '民宿',
    inn: '酒館',
    motel: '汽車旅館',
    rental: '公寓',
    resort: '渡假村',
    ryokan: '日式旅館'
  }

  def hotel_type_zh
    HotelType.hotel_types[self.type_name]
  end
end
