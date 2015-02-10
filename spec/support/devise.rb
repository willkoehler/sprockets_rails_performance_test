# include Devise helpers in controller specs
RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
end