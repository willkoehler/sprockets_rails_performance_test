Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Use AWS SES to deliver emails
  config.action_mailer.delivery_method = :ses

  # default url for rendering links in emails
  config.action_mailer.default_url_options = { host: "sprockets_test.dev" }

  # Split mailer log into separate log file. In development mode, ActionMailer logs the entire message payload
  # (including attachments) which can make the development log hard to read.
  config.action_mailer.logger = ActiveSupport::Logger.new File.join('log','mailer.log')

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  
  # Session idle timeout (enforced by enable_session_timeout() in common.js and Devise's config.timeout_in)
  config.session_timeout = 12.hours
end
