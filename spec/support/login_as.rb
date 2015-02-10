# Simulate user logins in controller and request specs
module LoginAs
  def login_as(user_type, password='pass99')
    let(:current_user) { create user_type, :password => password }
    before do
      if subject.is_a? ApplicationController
        # login user for controller specs
        sign_in current_user
      else
        # login user for feature specs
        visit new_user_session_path
        fill_in "Email", :with => current_user.email
        fill_in "Password", :with => 'pass99'
        click_button "Sign in"
      end
    end
  end
end

RSpec.configure do |config|
  config.extend LoginAs
end