class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :account

  validates :name, presence: true
  validates :document, presence: true, uniqueness: { case_sensitive: false }
end
