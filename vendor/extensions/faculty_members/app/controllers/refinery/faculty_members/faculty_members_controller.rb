module Refinery
  module FacultyMembers
    class FacultyMembersController < ::ApplicationController

      before_filter :find_all_faculty_members
      before_filter :find_page
      helper_method :year

      def index
        @faculty_members = FacultyMember.scoped
        
        @faculty_members = @faculty_members.joins(:expertise_areas).where('refinery_faculty_members_expertise_areas.id = ?', params[:area_of_expertise]) if params[:area_of_expertise].present?
        @faculty_members = @faculty_members.joins(:faculty_member_years).where('refinery_faculty_member_years.year = ?', year) unless year.blank?
        @faculty_members = @faculty_members.where('first_name ILIKE ?', params[:first_name]) if params[:first_name].present?
        @faculty_members = @faculty_members.where('last_name ILIKE ?', params[:last_name]) if params[:last_name].present?
        @faculty_members = @faculty_members.order(:last_name)
        
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @faculty_member in the line below:
        present(@page)
      end

      def show
        @faculty_member = FacultyMember.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @faculty_member in the line below:
        present(@page)
      end
      
    private
    
      def year
        params[:year] ||= "2013"
      end

    protected

      def find_all_faculty_members
        @faculty_members = FacultyMember.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/faculty_members").first
      end

    end
  end
end
