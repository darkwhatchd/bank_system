class MoneyTransferService
  def initialize(record)
    @record = record
  end

  def call
    @record.account.account_balance -= @record.value
    @record.destiny_account.account_balance += @record.value - TaxCalculateService.new(@record).call
    save!
  end

  def save!
    @record.account.save
    @record.destiny_account.save
  end
end
