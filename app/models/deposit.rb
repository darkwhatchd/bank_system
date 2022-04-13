class Deposit < ApplicationRecord
  has_one :operation, as: :operable
end
