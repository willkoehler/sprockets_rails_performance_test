require 'rails_helper'

describe SessionsController, :type => :controller do
  render_views
  before { @request.env["devise.mapping"] = Devise.mappings[:user] }   # see https://github.com/plataformatec/devise/wiki/How-To:-Controllers-tests-with-Rails-3-(and-rspec)

  let(:user) { create(:director, password: 'secret99') }
  let(:attr) { { email: user.email, password: 'secret99' } }
  
  context "when the user is not assigned to any hospitals" do
    describe "POST :create" do
      before { post :create, user: attr }
      it { should redirect_to landing_path }
    end
  end
end
