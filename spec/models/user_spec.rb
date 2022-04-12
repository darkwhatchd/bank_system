require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to have_one(:account) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:document) }
  it { is_expected.to validate_uniqueness_of(:document).case_insensitive }
end
