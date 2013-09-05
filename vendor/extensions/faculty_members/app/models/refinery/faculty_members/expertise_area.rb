module Refinery
  module FacultyMembers
    class ExpertiseArea < Refinery::Core::BaseModel
      
      has_many :faculty_member_expertise_areas
      has_many :faculty_members, :through => :faculty_member_expertise_areas

      attr_accessible :name, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
