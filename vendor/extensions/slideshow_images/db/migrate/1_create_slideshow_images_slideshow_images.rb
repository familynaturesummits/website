class CreateSlideshowImagesSlideshowImages < ActiveRecord::Migration

  def up
    create_table :refinery_slideshow_images do |t|
      t.string :header
      t.text :caption
      t.integer :image_id
      t.boolean :active
      t.integer :position
      t.integer :position

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
