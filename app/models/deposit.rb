class Deposit < ApplicationRecord
  belongs_to :account

  has_one :operation, as: :operable

  accepts_nested_attributes_for :operation, allow_destroy: true
end
