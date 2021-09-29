class CreateBookingRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_records do |t|
      t.string :status, comment: '預約記錄狀態'
      t.integer :person_count, comment: '預約人數'
      t.integer :price, comment: '預約房間價格'
      t.datetime :begin_date, comment: '起始日'
      t.datetime :end_date, comment: '結束日'
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
