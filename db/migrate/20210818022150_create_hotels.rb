class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name, comment: '飯店名稱'
      t.string :code, comment: '飯店代碼'
      t.string :description, comment: '飯店敘述'
      t.references :hotel_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
