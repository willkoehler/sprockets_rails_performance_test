module EmailValidationHelper

  def validate_email(email)
    email.blank? || (email =~ /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/) == 0
  end

  def validate_email_list(list)
    return true if list.blank?
    list.split(/,\s*/).map { |email| validate_email(email) }.reduce(:&)
  end
end