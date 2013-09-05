class CreateBaButtonsBaButtons < ActiveRecord::Migration

  def up
    create_table :refinery_ba_buttons do |t|
      t.string :title
      t.string :url
      t.string :color
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-ba_buttons"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/ba_buttons/ba_buttons"})
    end

    drop_table :refinery_ba_buttons

  end

end
