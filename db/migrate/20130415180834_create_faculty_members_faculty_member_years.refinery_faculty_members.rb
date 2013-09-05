# This migration comes from refinery_faculty_members (originally 4)
class CreateFacultyMembersFacultyMemberYears < ActiveRecord::Migration

  def up
    create_table :refinery_faculty_member_years do |t|
      t.integer :faculty_member_id
      t.string :year
      t.boolean :select_year, :default => false

      t.timestamps
    end
    add_index :refinery_faculty_member_years, :faculty_member_id

  end

  def down

    drop_table :refinery_faculty_member_years

  end

end
