class TransferSavingService
  def initialize(record)
    @record = record
  end

  def call
    if @record.value > @record.account.account_balance
      @record.errors.add :value, message: "can't be more than you have in account!"
      false
    else
      @record.save
    end
  end
end
