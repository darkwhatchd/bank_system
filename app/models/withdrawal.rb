class Withdrawal < ApplicationRecord
  has_one :operation, as: :operable
end
