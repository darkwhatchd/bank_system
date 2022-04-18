class AccountActiveValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.class == Transfer && record.destiny_account&.inactive?
      record.errors.add attribute, (options[:message] || "is inactive!")
    elsif record.account&.inactive?
      record.errors.add attribute, (options[:message] || "is inactive!")
    end
  end
end
