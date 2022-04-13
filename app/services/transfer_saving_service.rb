class TransferSavingService
  def initialize(record, operation_type = nil)
    @record = record
    @operation_type = operation_type
  end

  def call
    if @record.value > @record.account.account_balance && @operation_type != "Deposit"
      @record.errors.add :value, message: "can't be more than you have in account!"
      false
    else
      @record.save
    end
  end
end
