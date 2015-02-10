class EmailListValidator < ActiveModel::EachValidator
  include EmailValidationHelper

  def validate_each(record, attribute, value)
    unless value.blank? || validate_email_list(value)
      record.errors[attribute] << (options[:message] || "must be a list of valid email addresses")
    end
  end
end
