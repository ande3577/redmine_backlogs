class AddShowReleasesToRbProjectSettings < ActiveRecord::Migration
  def self.up
    add_column :rb_project_settings, :show_releases, :boolean, :default => true, :null => false
  end
  
  def self.down
    remove_column :rb_project_settings, :show_releases
  end
end

