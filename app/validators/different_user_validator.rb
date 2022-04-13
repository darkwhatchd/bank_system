class DifferentUserValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value == record.account
      record.errors.add attribute, (options[:message] || "can't be your own account!")
    end
  end
end
