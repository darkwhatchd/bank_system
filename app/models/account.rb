class Account < ApplicationRecord
  extend Enumerize

  belongs_to :user

  has_many :transfers, dependent: :destroy

  validates :account_balance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true

  enumerize :status, in: [:active, :inactive], default: :active, scope: :shallow
end
