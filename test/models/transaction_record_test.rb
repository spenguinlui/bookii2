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
require 'test_helper'

class TransactionRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
