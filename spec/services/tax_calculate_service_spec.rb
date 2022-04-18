require "rails_helper"

RSpec.describe TaxCalculateService, type: :model do
  context "when #call" do
    let(:account) { create(:account, account_balance: 1000) }
    let(:destiny_account) { create(:account, account_balance: 0) }

    context "when value <= 1000" do
      let!(:transfer) { build(:transfer, account: account, destiny_account: destiny_account, value: 100) }

      it "must be between 5..7" do
        service = described_class.new(transfer)
        tax = service.call

        expect(tax).to be_between(5, 7).inclusive
      end
    end

    context "when value > 1000" do
      let!(:transfer) { build(:transfer, account: account, destiny_account: destiny_account, value: 1100) }

      it "must be between 15..17" do
        service = described_class.new(transfer)
        tax = service.call

        expect(tax).to be_between(15, 17).inclusive
      end
    end
  end
end
