class CreateTransactionRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_records do |t|
      t.string :type, comment: '交易類型'
      t.integer :origin_amount, comment: '交易前金額'
      t.integer :transaction_amount, comment: '交易金額'
      t.integer :final_amount, comment: '交易後金額'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
