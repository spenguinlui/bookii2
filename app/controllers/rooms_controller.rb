class RoomsController < FrontController
  before_action :authenticate_user!, only: [:reservation, :booking]

  def index
    @hotel = Hotel.find(params[:hotel_id])
    @room_type_ids = @hotel.rooms.joins(:room_type).distinct.pluck(:room_type_id)
    @roomtyps = RoomType.find(@room_type_ids)
  end

  def reservation
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.find(params[:id])
  end

  def booking
    room = Room.find(params[:id])
    begin_datetime = params[:begin_datetime]
    end_datetime = params[:end_datetime]
    person_count = to_int_if_not(params[:person_count])
    # 檢查有無 有效預約記錄
    unless is_vacancy?(room, begin_datetime, end_datetime)
      redirect_back fallback_location: root_path, alert: '已經被預約了'
      return
    end

    # 檢查房間是否足夠
    unless room.room_is_enough?(person_count)
      redirect_back fallback_location: root_path, alert: '人數超過限制'
      return
    end

    # 檢查錢是否足夠
    unless current_user.amount_has_enough?(room.price)
      redirect_back fallback_location: root_path, alert: '款項不夠'
      return
    end

    current_user.booking_and_pay(room, begin_datetime, end_datetime, person_count)
    redirect_to hotel_rooms_path(params[:hotel_id])
  end

  private

  # 待改範圍、方法
  def is_vacancy? room, begin_datetime, end_datetime
    room.check_date_is_enable(begin_datetime) && room.check_date_is_enable(end_datetime)
  end

  def to_int_if_not number
    number.is_a?(Integer) ? number : number.to_i
  end
end