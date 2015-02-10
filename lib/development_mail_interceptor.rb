# Redirect all emails to developer's email when in development mode
# Tip from http://railscasts.com/episodes/206
class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = SprocketsTest.config.development_redirect_to
  end
end