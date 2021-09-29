class AddRoteToBookingRecords < ActiveRecord::Migration[6.0]
  def change
    change_column :booking_records, :status, :string, default: 'pending'
    change_column :booking_records, :person_count, :integer, default: 1
  end
end
