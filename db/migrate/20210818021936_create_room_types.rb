class CreateRoomTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :room_types do |t|
      t.string :type_name, comment: '類型名稱'
      t.integer :person_default_count, comment: '房間預設容許人數'

      t.timestamps
    end
  end
end
