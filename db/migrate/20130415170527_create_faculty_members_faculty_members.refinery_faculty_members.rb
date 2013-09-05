# This migration comes from refinery_faculty_members (originally 1)
class CreateFacultyMembersFacultyMembers < ActiveRecord::Migration

  def up
    create_table :refinery_faculty_members do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :email
      t.string :url
      t.integer :picture_id
      t.integer :vcard_id
      t.integer :position
      t.string :slug

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-faculty_members"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/faculty_members/faculty_members"})
    end

    drop_table :refinery_faculty_members

  end

end
