class Statement < ApplicationRecord
  belongs_to :account

  validates :start_date, presence: true
  validates :start_date, past_date: true
  validates :finish_date, presence: true
  validates :finish_date, past_date: true
end
