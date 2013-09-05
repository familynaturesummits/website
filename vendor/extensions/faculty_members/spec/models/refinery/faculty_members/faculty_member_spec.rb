require 'spec_helper'

module Refinery
  module FacultyMembers
    describe FacultyMember do
      describe "validations" do
        subject do
          FactoryGirl.create(:faculty_member,
          :first_name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:first_name) { should == "Refinery CMS" }
      end
    end
  end
end
