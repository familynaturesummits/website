module Refinery
  module SlideshowImages
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::SlideshowImages

      engine_name :refinery_slideshow_images

      initializer "register refinerycms_slideshow_images plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "slideshow_images"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.slideshow_images_admin_slideshow_images_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/slideshow_images/slideshow_image',
            :title => 'header'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::SlideshowImages)
      end
    end
  end
end
