require "rails_helper"

RSpec.describe OperationSavingService, type: :model do
  context "when #call" do
    context "when have cash to transfer/withdrawal" do
      let!(:account) { create(:account, account_balance: 1000) }
      let!(:withdrawal) { build(:withdrawal, account: account) }
      let!(:operation) { build(:operation, value: 100) }

      it "must be success" do
        operation.operable = withdrawal
        withdrawal.operation = operation

        expect do
          service = described_class.new(withdrawal, operation.value)
          service.call
          account.reload
        end.to change(account.withdrawals, :count).by(1)
      end
    end

    context "when dont have cash to transfer/withdrawal" do
      let!(:account) { create(:account, account_balance: 0) }
      let!(:withdrawal) { build(:withdrawal, account: account) }
      let!(:operation) { build(:operation, value: 100) }

      it "must be fail" do
        operation.operable = withdrawal
        withdrawal.operation = operation

        expect do
          service = described_class.new(withdrawal, operation.value)
          service.call
          account.reload
        end.to_not change(account.withdrawals, :count)
      end
    end
  end
end
