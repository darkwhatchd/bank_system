class Statement < ApplicationRecord
  belongs_to :account

  validates :start_date, presence: true, past_date: true
  validates :finish_date, presence: true, past_date: true
end
