# == Schema Information
#
# Table name: transaction_records
#
#  id                 :integer          not null, primary key
#  final_amount       :integer
#  origin_amount      :integer
#  transaction_amount :integer
#  transaction_type   :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer          not null
#
# Indexes
#
#  index_transaction_records_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class TransactionRecord < ApplicationRecord
  belongs_to :user

  def transaction_type_zh
    if self.transaction_type == 'deposit'
      '儲值'
    elsif self.transaction_type == 'reset'
      '重設'
    else
      '其他'
    end
  end
end
