class SelectOperationsService
  def initialize(statement)
    @statement = statement
  end

  def call
    @operations = @statement.account.operations.select do |op|
      op.operation_date >= @statement.start_date && op.operation_date <= @statement.finish_date
    end
  end
end
