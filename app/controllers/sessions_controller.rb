class SessionsController < Devise::SessionsController
  skip_authorization_check              # cancan authorization is not required
  skip_filter :must_change_password

  def create
    cookies[:login_email] = { value: params[:user][:email], expires: 2.weeks.from_now }
    super
  end
  
  def destroy
    super
    set_flash_message :notice, :timeout_js, minutes: (SprocketsTest.config.session_timeout/60) if params[:timeout] && is_flashing_format?
  end

end