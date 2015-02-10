module MailHelper
  extend ActiveSupport::Concern

  def last_email
    ActionMailer::Base.deliveries.last
  end

  def reset_email
    ActionMailer::Base.deliveries = []
  end
  
  included do
    before { reset_email }
  end
end
