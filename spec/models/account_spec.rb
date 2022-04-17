require "rails_helper"

RSpec.describe Account, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :transfers }
  it { is_expected.to have_many :operations }
  it { is_expected.to have_many :statements }

  it { is_expected.to validate_presence_of(:account_balance) }
  it { is_expected.to validate_numericality_of(:account_balance).is_greater_than_or_equal_to(0) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to enumerize(:status).in(:active, :inactive).with_default(:active).with_scope(:shallow) }
end
