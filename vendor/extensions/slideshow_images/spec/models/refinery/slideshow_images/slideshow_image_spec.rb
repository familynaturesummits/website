require 'spec_helper'

module Refinery
  module SlideshowImages
    describe SlideshowImage do
      describe "validations" do
        subject do
          FactoryGirl.create(:slideshow_image,
          :header => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:header) { should == "Refinery CMS" }
      end
    end
  end
end
