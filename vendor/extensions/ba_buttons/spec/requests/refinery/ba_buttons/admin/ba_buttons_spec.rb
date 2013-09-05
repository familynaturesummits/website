# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "BaButtons" do
    describe "Admin" do
      describe "ba_buttons" do
        login_refinery_user

        describe "ba_buttons list" do
          before do
            FactoryGirl.create(:ba_button, :title => "UniqueTitleOne")
            FactoryGirl.create(:ba_button, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.ba_buttons_admin_ba_buttons_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.ba_buttons_admin_ba_buttons_path

            click_link "Add New Ba Button"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::BaButtons::BaButton.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::BaButtons::BaButton.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:ba_button, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.ba_buttons_admin_ba_buttons_path

              click_link "Add New Ba Button"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::BaButtons::BaButton.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:ba_button, :title => "A title") }

          it "should succeed" do
            visit refinery.ba_buttons_admin_ba_buttons_path

            within ".actions" do
              click_link "Edit this ba button"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:ba_button, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.ba_buttons_admin_ba_buttons_path

            click_link "Remove this ba button forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::BaButtons::BaButton.count.should == 0
          end
        end

      end
    end
  end
end
