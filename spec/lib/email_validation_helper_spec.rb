require 'rails_helper'
require 'email_validation_helper'

describe EmailValidationHelper do
  include EmailValidationHelper

  describe "#validate_email" do
    subject { validate_email(email) }
    context "when email is blank" do
      let(:email) { '' }
      it { should be true }
    end
    context "when email is nil" do
      let(:email) { nil }
      it { should be true }
    end
    context "when email is invalid" do
      let(:email) { 'bademail' }
      it { should be false }
    end
    context "when email is valid" do
      let(:email) { 'good@email.com' }
      it { should be true }
    end
  end

  describe "#validate_email_list" do
    subject { validate_email_list(email_list) }
    context "when email list is blank" do
      let(:email_list) { '' }
      it { should be true }
    end
    context "when email list is nil" do
      let(:email_list) { nil }
      it { should be true }
    end
    it "should return false for invalid list of emails" do
      validate_email_list('good@email.com, bademail').should be false
      validate_email_list('bademail').should be false
      validate_email_list('good@email.com commamissing@email.com').should be false
    end
    it "should return true for valid list of emails" do
      validate_email_list('good@email.com, anothergood@email.com').should be true
      validate_email_list('good@email.com').should be true
    end
  end
end