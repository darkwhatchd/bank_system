require "rails_helper"

RSpec.describe Transfer, type: :model do
  it { is_expected.to belong_to :account }
  it { is_expected.to belong_to :destiny_account }
  it { is_expected.to validate_presence_of(:account) }
  it { is_expected.to validate_presence_of(:destiny_account) }
  it { is_expected.to validate_presence_of(:transfer_date) }
  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_numericality_of(:value).is_greater_than(0) }
end
