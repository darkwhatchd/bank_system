class Operation < ApplicationRecord
  belongs_to :operable, polymorphic: true

  validates :value, presence: true, numericality: { greater_than: 0 }
  validates :operation_date, presence: true
end
