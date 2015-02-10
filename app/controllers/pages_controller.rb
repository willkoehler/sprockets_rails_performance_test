class PagesController < ApplicationController
  skip_filter :authenticate_user!, :only => :home
  skip_authorization_check  # cancan authorization is not required

  def landing
    render text: '<h3>You logged in!</h3>', layout: true
  end

  def home
    redirect_to landing_path if current_user
  end
  
end
