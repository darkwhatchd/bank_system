require "rails_helper"

RSpec.describe Withdrawal, type: :model do
  it { is_expected.to have_one(:operation) }
end
