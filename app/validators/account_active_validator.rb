class AccountActiveValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.account.inactive? || record.destiny_account&.inactive?
      record.errors.add attribute, (options[:message] || "is inactive!")
    end
  end
end
