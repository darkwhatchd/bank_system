class MoneyTransferService
  def initialize(record)
    @record = record
  end

  def call
    if @record.class == Withdrawal
      @record.account.account_balance -= @record.operation.value
      @record.account.save
    elsif @record.class == Deposit
      @record.account.account_balance += @record.operation.value
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
