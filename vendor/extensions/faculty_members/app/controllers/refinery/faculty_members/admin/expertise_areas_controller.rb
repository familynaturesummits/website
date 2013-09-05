module Refinery
  module FacultyMembers
    module Admin
      class ExpertiseAreasController < ::Refinery::AdminController

        crudify :'refinery/faculty_members/expertise_area',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
