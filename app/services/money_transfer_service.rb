class MoneyTransferService
  def initialize(record, operation_type = nil)
    @record = record
    @operation_type = operation_type
  end

  def call
    if @operation_type == "Withdrawal"
      @record.account.account_balance -= @record.value
      @record.account.save
    elsif @operation_type == "Deposit"
      @record.account.account_balance += @record.value
      @record.account.save
    else
      @record.account.account_balance -= @record.value
      @record.destiny_account.account_balance += @record.value - TaxCalculateService.new(@record).call
      save!
    end
  end

  def save!
    @record.account.save
    @record.destiny_account.save
  end
end
