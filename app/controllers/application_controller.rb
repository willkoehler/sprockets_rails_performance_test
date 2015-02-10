class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  check_authorization   # ensure cancan authorization takes place in all controller actions
  include ListContextHelper
  include ReturnToHelper
  include NavigationHelper

  before_filter :authenticate_user!     # provided by Devise
  before_filter :check_referrer_stack
  before_filter :must_change_password

  rescue_from CanCan::AccessDenied do |e|
    render text: "<h3>You are not authorized to access this resource</h3>", layout: !request.xhr?, :status => :forbidden
  end

  rescue_from ActionController::UnpermittedParameters do |e|
    render text: "<h3>Received unpermitted parameters: #{e.params.join(', ')}</h3>", layout: !request.xhr?, :status => :forbidden
  end

  private

    # For Devise - path to go to after sign in.
    def after_sign_in_path_for(resource)
      stored_location_for(resource) || landing_path
    end
    
    def must_change_password
      if current_user && current_user.must_change_pw
        return_to(request.original_url)
        redirect_to edit_password_path, :notice => 'You must choose a new password before continuing'
      end
    end
end
