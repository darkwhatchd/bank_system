class PastDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.nil?
      if value > Time.now
        record.errors.add attribute, (options[:message] || "can't be future date!")
      end
    end
  end
end
