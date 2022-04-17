class PastDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value > Time.now
      record.errors.add attribute, (options[:message] || "can't be future date!")
    end
  end
end
