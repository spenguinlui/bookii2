class ChangeStatusToBookingRecord < ActiveRecord::Migration[6.0]
  def change
    change_column_null :booking_records, :status, true
  end
end
