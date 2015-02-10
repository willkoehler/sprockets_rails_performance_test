require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SprocketsTest
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += %W(#{config.root}/lib #{config.root}/lib/validators)

    # Precompile additional assets.
    # application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
    config.assets.precompile += %w( users.js categories.js ops_audit_standards.js ops_audit_edit.js ops_audit_status.js
                                    ops_audit_index.js rev_exp_months.js rev_exp_charts.js highcharts/small_theme.js
                                    rev_exp_edit_chart.js)

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Eastern Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Don't include all helpers in all views. Only include helpers that match the controller name.
    config.action_controller.include_all_helpers = false
    
    # Raise an exception on unpermitted parameters
    config.action_controller.action_on_unpermitted_parameters = :raise

    # Default reply-to and notification email addresses
    config.reply_to_address = 'noreply@cmscontracts.com'  # TODO update to use the pathway domain, after it's registered
    config.question_address = 'mmccarrell@psiscs.com'     # TODO update to correct support email address
    config.exception_notification_address = 'sysadmin@pharmacysystems.com'
    config.development_redirect_to = 'wck555@gmail.com'
  end
  
  # Convenience method that allows accessing config with 'SprocketsTest.config'
  def self.config() Application.config end
end
