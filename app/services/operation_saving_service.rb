class OperationSavingService
  def initialize(record, value)
    @record = record
    @value = value
  end

  def call
    if @value > @record.account.account_balance && @record.class != Deposit
      @record.errors.add :base, message: "can't be more than you have in account!"
      false
    else
      @record.save
    end
  end
end
