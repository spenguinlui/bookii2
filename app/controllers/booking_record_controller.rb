class BookingRecordController < FrontController
  def index

  end

  def show
    @booking_record = BookingRecord.joins(:room).find(params[:id])
  end

  def cancel
    @booking_record = BookingRecord.find(params[:id])
    @booking_record.canceled!
    redirect_to user_index_path
  end
end