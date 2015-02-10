require 'rails_helper'

describe Date do
  describe ".num_months_in" do
    it "should return number of months between two dates" do
      Date.num_months_in(Date.new(2000,1,1)..Date.new(2001,1,1)).should == 13
      Date.num_months_in(Date.new(2001,1,1)..Date.new(2001,5,1)).should == 5
    end
  end
end
