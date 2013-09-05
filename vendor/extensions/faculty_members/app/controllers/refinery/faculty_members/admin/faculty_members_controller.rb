module Refinery
  module FacultyMembers
    module Admin
      class FacultyMembersController < ::Refinery::AdminController

        crudify :'refinery/faculty_members/faculty_member',
                :title_attribute => 'full_name', :xhr_paging => true,
                                                                  :order => "last_name ASC",
                                                                  :sortable => false

      end
    end
  end
end
