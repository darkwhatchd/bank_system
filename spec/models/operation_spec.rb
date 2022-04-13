require "rails_helper"

RSpec.describe Operation, type: :model do
  subject { build(:operation) }
  it { is_expected.to belong_to :operable }

  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_numericality_of(:value).is_greater_than(0) }
  it { is_expected.to validate_presence_of(:operation_date) }
end
