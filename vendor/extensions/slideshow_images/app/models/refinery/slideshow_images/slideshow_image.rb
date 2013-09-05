module Refinery
  module SlideshowImages
    class SlideshowImage < Refinery::Core::BaseModel
      self.table_name = 'refinery_slideshow_images'

      attr_accessible :header, :caption, :image_id, :active, :position, :position

      acts_as_indexed :fields => [:header, :caption]

      validates :header, :presence => true, :uniqueness => true

      belongs_to :image, :class_name => '::Refinery::Image'
    end
  end
end
