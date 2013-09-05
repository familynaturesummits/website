# This migration comes from refinery_faculty_members (originally 3)
class CreateFacultyMembersFacultyMemberExpertiseAreas < ActiveRecord::Migration

  def up
    create_table :refinery_faculty_areas do |t|
      t.integer :faculty_member_id
      t.integer :expertise_area_id

      t.timestamps
    end
    add_index :refinery_faculty_areas, :faculty_member_id
    add_index :refinery_faculty_areas, :expertise_area_id

  end

  def down

    drop_table :refinery_faculty_member_expertise_areas

  end

end
