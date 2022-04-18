class TransferSavingService
  def initialize(record, value)
    @record = record
    @value = value
  end

  def call
    if @value - TaxCalculateService.new(@record).call <= 0
      @record.errors.add :base, message: "must transfer more than 0!"
      false
    else
      @record.save
    end
  end
end
