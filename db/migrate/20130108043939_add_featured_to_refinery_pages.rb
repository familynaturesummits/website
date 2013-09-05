class AddFeaturedToRefineryPages < ActiveRecord::Migration
  def change
    add_column :refinery_pages, :featured, :boolean, :default => false
  end
end
