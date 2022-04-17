class SelectOperationsService
  def initialize(statement)
    @statement = statement
  end

  def call
    @operations = select_operations
    @transfers = select_transfers
    @transfers_operations = @operations.concat(@transfers).sort_by { |element| element.created_at }.reverse
  end

  def select_operations
    @operations = @statement.account.operations.select do |op|
      op.operation_date >= @statement.start_date && op.operation_date <= @statement.finish_date
    end
  end

  def select_transfers
    @transfers = @statement.account.transfers.select do |op|
      op.transfer_date >= @statement.start_date && op.transfer_date <= @statement.finish_date
    end
  end
end
