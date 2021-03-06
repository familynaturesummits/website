module Refinery
  module FacultyMembers
    class ExpertiseAreasController < ::ApplicationController

      before_filter :find_all_expertise_areas
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @expertise_area in the line below:
        present(@page)
      end

      def show
        @expertise_area = ExpertiseArea.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @expertise_area in the line below:
        present(@page)
      end

    protected

      def find_all_expertise_areas
        @expertise_areas = ExpertiseArea.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/expertise_areas").first
      end

    end
  end
end
