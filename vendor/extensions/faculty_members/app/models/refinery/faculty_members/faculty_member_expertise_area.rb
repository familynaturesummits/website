module Refinery
  module FacultyMembers
    class FacultyMemberExpertiseArea < Refinery::Core::BaseModel
      self.table_name = 'refinery_faculty_areas'

      belongs_to :faculty_member
      belongs_to :expertise_area
      
      attr_accessible :faculty_member_id, :expertise_area_id

    end
  end
end
