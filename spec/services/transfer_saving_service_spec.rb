require "rails_helper"

RSpec.describe TransferSavingService, type: :model do
  context "when #call" do
    let!(:account) { create(:account, account_balance: 1000) }
    let!(:destiny_account) { create(:account, account_balance: 0) }

    context "when value <= 0" do
      let!(:transfer) { build(:transfer, account: account, destiny_account: destiny_account, value: 0) }

      it "must not save" do
        expect do
          service = described_class.new(transfer, transfer.value)
          service.call
        end.to_not change(Transfer, :count)
      end
    end
  end
end
