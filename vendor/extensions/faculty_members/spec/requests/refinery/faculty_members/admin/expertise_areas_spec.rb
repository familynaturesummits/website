# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "FacultyMembers" do
    describe "Admin" do
      describe "expertise_areas" do
        login_refinery_user

        describe "expertise_areas list" do
          before do
            FactoryGirl.create(:expertise_area, :name => "UniqueTitleOne")
            FactoryGirl.create(:expertise_area, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.faculty_members_admin_expertise_areas_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.faculty_members_admin_expertise_areas_path

            click_link "Add New Expertise Area"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::FacultyMembers::ExpertiseArea.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::FacultyMembers::ExpertiseArea.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:expertise_area, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.faculty_members_admin_expertise_areas_path

              click_link "Add New Expertise Area"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::FacultyMembers::ExpertiseArea.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:expertise_area, :name => "A name") }

          it "should succeed" do
            visit refinery.faculty_members_admin_expertise_areas_path

            within ".actions" do
              click_link "Edit this expertise area"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:expertise_area, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.faculty_members_admin_expertise_areas_path

            click_link "Remove this expertise area forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::FacultyMembers::ExpertiseArea.count.should == 0
          end
        end

      end
    end
  end
end
