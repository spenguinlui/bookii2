# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  amount                 :integer          default(0), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :booking_records
  has_many :transaction_records

  def reset_amount amount
    origin_amount = self.amount
    User.transaction do
      self.update!(amount: amount)
      TransactionRecord.create!(user_id: self.id, transaction_type: 'reset', origin_amount: origin_amount, transaction_amount: amount, final_amount: self.amount)
    end
  end

  def deposit amount
    origin_amount = self.amount
    User.transaction do
      self.update!(amount: self.amount + amount)
      TransactionRecord.create!(user_id: self.id, transaction_type: 'deposit', origin_amount: origin_amount, transaction_amount: amount, final_amount: self.amount)
    end
  end

  def amount_has_enough? price
    self.amount >= price
  end

  def booking_and_pay room, begin_date, end_date, person_count
    BookingRecord.transaction do
      new_record = BookingRecord.create!(room_id: room.id, user_id: self.id, price: room.price, person_count: person_count, begin_date: begin_date, end_date: end_date)
      deduce(room.price, 'booking')
      new_record.reserving!
    end
  end

  private

  def deduce amount, type
    origin_amount = self.amount
    User.transaction do
      self.update!(amount: self.amount - amount)
      TransactionRecord.create!(user_id: self.id, transaction_type: type, origin_amount: origin_amount, transaction_amount: amount, final_amount: self.amount)
    end
  end
end
