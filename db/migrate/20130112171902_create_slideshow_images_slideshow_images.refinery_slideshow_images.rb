# This migration comes from refinery_slideshow_images (originally 1)
class CreateSlideshowImagesSlideshowImages < ActiveRecord::Migration

  def up
    create_table :refinery_slideshow_images do |t|
      t.string :header
      t.text :caption
      t.integer :image_id
      t.boolean :active, :default => true
      t.integer :position, :default => 0

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-slideshow_images"})
    end

    drop_table :refinery_slideshow_images

  end

end
