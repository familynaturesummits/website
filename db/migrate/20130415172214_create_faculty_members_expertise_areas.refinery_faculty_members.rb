# This migration comes from refinery_faculty_members (originally 2)
class CreateFacultyMembersExpertiseAreas < ActiveRecord::Migration

  def up
    create_table :refinery_faculty_members_expertise_areas do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-faculty_members"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/faculty_members/expertise_areas"})
    end

    drop_table :refinery_faculty_members_expertise_areas

  end

end
