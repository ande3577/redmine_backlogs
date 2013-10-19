class AddIsSprintToVersion < ActiveRecord::Migration
  def self.up
    add_column :versions, :is_sprint, :boolean, :default => false, :null => false
    # for existing projects with backlogs enabled, set all versions as sprints for backwards compatibility
    Version.all.each do |v| 
      v.update_attribute(:is_sprint, true) if v.project && v.project.module_enabled?('backlogs')
    end
  end

  def self.down
    remove_column :versions, :is_sprint
  end
end
