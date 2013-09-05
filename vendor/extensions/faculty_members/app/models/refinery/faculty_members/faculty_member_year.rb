module Refinery
  module FacultyMembers
    class FacultyMemberYear < Refinery::Core::BaseModel
      self.table_name = 'refinery_faculty_member_years'

      belongs_to :faculty_member

      attr_accessible :faculty_member_id, :year, :select_year

    end
  end
end
