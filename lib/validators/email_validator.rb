class EmailValidator < ActiveModel::EachValidator
  include EmailValidationHelper

  def validate_each(record, attribute, value)
    unless value.blank? || validate_email(value)
      record.errors[attribute] << (options[:message] || "must be a valid email address")
    end
  end
end
