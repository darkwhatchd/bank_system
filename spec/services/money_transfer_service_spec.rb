require "rails_helper"

RSpec.describe MoneyTransferService, type: :model do
  context "when #call" do
    context "when transfer" do
      let(:account) { create(:account, account_balance: 1000) }
      let(:destiny_account) { create(:account, account_balance: 0) }

      let!(:transfer) { build(:transfer, value: 100, account: account, destiny_account: destiny_account) }

      it "must remove cash with transfer tax from account" do
        service = described_class.new(transfer)
        service.call

        expect(account.account_balance - TaxCalculateService.new(transfer).call).to eq(1000 - transfer.value - TaxCalculateService.new(transfer).call)
      end
    end

    context "when deposit" do
      let!(:account) { create(:account, account_balance: 1000) }
      let!(:deposit) { create(:deposit, account: account) }
      let!(:operation) { create(:operation, value: 100) }

      it "must deposit cash" do
        operation.operable = deposit
        deposit.operation = operation
        service = described_class.new(deposit)
        service.call

        expect(account.account_balance).to eq(1000 + deposit.operation.value)
      end
    end

    context "when withdrawal" do
      let!(:account) { create(:account, account_balance: 1000) }
      let!(:withdrawal) { create(:withdrawal, account: account) }
      let!(:operation) { create(:operation, value: 100) }

      it "must remove cash" do
        operation.operable = withdrawal
        withdrawal.operation = operation
        service = described_class.new(withdrawal)
        service.call

        expect(account.account_balance).to eq(1000 - withdrawal.operation.value)
      end
    end
  end
end
