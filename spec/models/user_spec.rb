require 'rails_helper'

describe User, :type => :model do
  let(:valid_attr) { attributes_for(:user) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:role) }

  it { should validate_presence_of(:email) }
  it { should_not allow_value('notvalid').for(:email) }
  it { should allow_value('test@mail.com').for(:email) }
  describe '#email' do
    subject { create(:user) }
    it { should validate_uniqueness_of(:email).with_message('there is already a user with this email') }
  end

  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('good99').for(:password) }
  it { should allow_value('nodigits').for(:password) }
  it "should require password on create" do
    user = User.create
    user.errors.messages.should include(:password)
    user.errors.messages[:password].should include("can't be blank")
  end
  it "should NOT require password to update user" do
    user = create(:user)
    User.first.update!(name: 'Sam User')
  end
  it "should NOT allow blank password if password is present" do
    user = create(:user)
    user.update(name: 'Sam User', password: '')
    user.errors.messages.should include(:password)
    user.errors.messages[:password].should include("can't be blank")
  end

  describe '#active_for_authentication?' do
    let(:user) { build_stubbed(:user, archived: archived, can_login: can_login) }
    let(:archived) { false }
    let(:can_login) { true }
    subject { user.active_for_authentication? }
    context "when user is not archived" do
      it { should be true }
      context "and the user cannot login" do
        let(:can_login) { false }
        it { should be false }
      end
    end
    context "when user is archived" do
      let(:archived) { true }
      it { should be false }
    end
  end
  
end  
