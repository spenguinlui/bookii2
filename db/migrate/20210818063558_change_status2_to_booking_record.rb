class ChangeStatus2ToBookingRecord < ActiveRecord::Migration[6.0]
  def change
    change_column :booking_records, :status, :integer, default: 0
  end
end
