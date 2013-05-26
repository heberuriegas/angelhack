class RemoveNameToReports < ActiveRecord::Migration
  def up
    remove_column :reports, :name
  end

  def down
    add_column :reports, :name, :string
  end
end
