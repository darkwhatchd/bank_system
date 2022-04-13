class TaxCalculateService
  def initialize(record)
    @record = record
  end

  def call
    tax = 0
    if @record.value > 1000
      tax += 10
    end

    if (@record.transfer_date.hour >= 18 || @record.transfer_date.hour < 9) && !@record.transfer_date.saturday? && !@record.transfer_date.sunday?
      return tax += 7
    elsif @record.transfer_date.saturday? || @record.transfer_date.sunday?
      return tax += 7
    else
      return tax += 5
    end
  end
end
