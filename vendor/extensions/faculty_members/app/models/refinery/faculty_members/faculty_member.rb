module Refinery
  module FacultyMembers
    class FacultyMember < Refinery::Core::BaseModel
      self.table_name = 'refinery_faculty_members'
      
      has_many :faculty_member_expertise_areas, :dependent => :destroy
      has_many :expertise_areas, :through => :faculty_member_expertise_areas
      has_many :faculty_member_years, :dependent => :destroy
        accepts_nested_attributes_for :faculty_member_years

      attr_accessible :first_name, :last_name, :description, :email, :url, :picture_id, :vcard_id, :position, :expertise_area_ids, :faculty_member_years_attributes

      acts_as_indexed :fields => [:first_name, :last_name, :description, :email, :url]

      #validates :first_name, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'

      belongs_to :vcard, :class_name => '::Refinery::Resource'
      
      after_commit :destroy_unselected_years
      
      extend FriendlyId
            friendly_id :full_name, :use => :slugged
      
      def full_name
        "#{self.first_name} #{self.last_name}"
      end
      
      protected 

        def destroy_unselected_years
          faculty_member_years.each do |year|
            if !year.select_year?
              year.destroy
            end
          end
        end
        
        
    end
  end
end
