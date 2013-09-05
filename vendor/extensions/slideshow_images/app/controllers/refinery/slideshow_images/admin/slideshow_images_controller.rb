module Refinery
  module SlideshowImages
    module Admin
      class SlideshowImagesController < ::Refinery::AdminController

        crudify :'refinery/slideshow_images/slideshow_image',
                :title_attribute => 'header', :xhr_paging => true

      end
    end
  end
end
