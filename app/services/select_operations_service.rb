class SelectOperationsService
  def initialize(statement)
    @statement = statement
  end

  def call
    @withdrawals = select_withdrawals
    @deposits = select_deposits
    @transfers = select_transfers
    @transfers_operations = @withdrawals.concat(@transfers, @deposits).sort_by { |element| element.created_at }.reverse
  end

  def select_withdrawals
    @withdrawals = @statement.account.withdrawals.select do |wd|
      wd.operation.operation_date >= @statement.start_date && wd.operation.operation_date <= @statement.finish_date
    end
  end

  def select_deposits
    @deposits = @statement.account.deposits.select do |dp|
      dp.operation.operation_date >= @statement.start_date && dp.operation.operation_date <= @statement.finish_date
    end
  end

  def select_transfers
    @transfers = @statement.account.transfers.select do |op|
      op.transfer_date >= @statement.start_date && op.transfer_date <= @statement.finish_date
    end
  end
end
