class ChangeTransactionTypeToTransactionRecord < ActiveRecord::Migration[6.0]
  def change
    rename_column :transaction_records, :type, :transaction_type
  end
end
