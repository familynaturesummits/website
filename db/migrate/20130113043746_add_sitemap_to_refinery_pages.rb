class AddSitemapToRefineryPages < ActiveRecord::Migration
  def change
    add_column :refinery_pages, :sitemap, :boolean, :default => true
  end
end
