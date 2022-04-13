class Transfer < ApplicationRecord
  belongs_to :account
  belongs_to :destiny_account, class_name: "Account"

  validates :account, presence: true
  validates :destiny_account, presence: true, different_user: true
  validates :transfer_date, presence: true
  validates :value, presence: true, numericality: { greater_than: 0 }
end
