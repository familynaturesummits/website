module Refinery
  module FacultyMembers
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::FacultyMembers

      engine_name :refinery_faculty_members

      initializer "register refinerycms_faculty_members plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "faculty_members"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.faculty_members_admin_faculty_members_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/faculty_members/faculty_member',
            :title => 'first_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::FacultyMembers)
      end
    end
  end
end
