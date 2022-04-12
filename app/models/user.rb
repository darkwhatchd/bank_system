class User < ApplicationRecord
  validates :name, presence: true
  validates :document, presence: true
end
