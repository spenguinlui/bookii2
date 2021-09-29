class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_number, comment: '房間號碼'
      t.integer :price, comment: '房間價格'
      t.integer :person_count, comment: '房間容許人數'
      t.references :hotel, null: false, foreign_key: true
      t.references :room_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
