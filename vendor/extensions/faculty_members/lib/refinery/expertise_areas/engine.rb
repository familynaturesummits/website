module Refinery
  module FacultyMembers
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::FacultyMembers

      engine_name :refinery_faculty_members

      initializer "register refinerycms_expertise_areas plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "expertise_areas"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.faculty_members_admin_expertise_areas_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/faculty_members/expertise_area',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/faculty_members/expertise_areas(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ExpertiseAreas)
      end
    end
  end
end
