class Statement < ApplicationRecord
  belongs_to :account

  validates :start_date, presence: true
  validates :finish_date, presence: true
end
