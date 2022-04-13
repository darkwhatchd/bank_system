class TaxCalculateService
  def initialize(record)
    @record = record
  end

  def call
    if @record.value > 1000
      @record.value += 10
    end

    if (@record.transfer_date.hour >= 18 || @record.transfer_date.hour < 9) && !@record.transfer_date.saturday? && !@record.transfer_date.sunday?
      @record.value += 7
    elsif @record.transfer_date.saturday? || @record.transfer_date.sunday?
      @record.value += 7
    else
      @record.value += 5
    end
  end
end
