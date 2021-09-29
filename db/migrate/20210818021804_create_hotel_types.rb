class CreateHotelTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :hotel_types do |t|
      t.string :type_name, comment: '類型名稱'

      t.timestamps
    end
  end
end
