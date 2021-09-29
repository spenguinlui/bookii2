class Admin::BookingRecordsController < Admin::BackController
  def index
    @booking_records = BookingRecord.includes(:room, :user).all
  end
end