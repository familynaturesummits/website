# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "SlideshowImages" do
    describe "Admin" do
      describe "slideshow_images" do
        login_refinery_user

        describe "slideshow_images list" do
          before do
            FactoryGirl.create(:slideshow_image, :header => "UniqueTitleOne")
            FactoryGirl.create(:slideshow_image, :header => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.slideshow_images_admin_slideshow_images_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.slideshow_images_admin_slideshow_images_path

            click_link "Add New Slideshow Image"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Header", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::SlideshowImages::SlideshowImage.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Header can't be blank")
              Refinery::SlideshowImages::SlideshowImage.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:slideshow_image, :header => "UniqueTitle") }

            it "should fail" do
              visit refinery.slideshow_images_admin_slideshow_images_path

              click_link "Add New Slideshow Image"

              fill_in "Header", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::SlideshowImages::SlideshowImage.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:slideshow_image, :header => "A header") }

          it "should succeed" do
            visit refinery.slideshow_images_admin_slideshow_images_path

            within ".actions" do
              click_link "Edit this slideshow image"
            end

            fill_in "Header", :with => "A different header"
            click_button "Save"

            page.should have_content("'A different header' was successfully updated.")
            page.should have_no_content("A header")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:slideshow_image, :header => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.slideshow_images_admin_slideshow_images_path

            click_link "Remove this slideshow image forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::SlideshowImages::SlideshowImage.count.should == 0
          end
        end

      end
    end
  end
end
