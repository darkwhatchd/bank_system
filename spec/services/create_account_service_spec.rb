require "rails_helper"

RSpec.describe CreateAccountService, type: :model do
  context "when #call" do
    let!(:user) { create(:user) }

    it "must create an account" do
      expect do
        service = described_class.new(user)
        service.call
      end.to change(Account, :count).by(1)
    end

    it "account balance must be 0" do
      service = described_class.new(user)
      service.call
      expect(Account.last.account_balance).to eq(0)
    end

    it "account user must be correct" do
      service = described_class.new(user)
      service.call
      expect(Account.last.user).to eq(user)
    end
  end
end
