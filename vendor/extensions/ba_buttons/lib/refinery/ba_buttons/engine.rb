module Refinery
  module BaButtons
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::BaButtons

      engine_name :refinery_ba_buttons

      initializer "register refinerycms_ba_buttons plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "ba_buttons"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.ba_buttons_admin_ba_buttons_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/ba_buttons/ba_button'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::BaButtons)
      end
    end
  end
end
