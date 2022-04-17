require "rails_helper"

RSpec.describe Statement, type: :model do
  it { is_expected.to belong_to(:account) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:finish_date) }
end
