class RemoveGmapsToReports < ActiveRecord::Migration
  def up
    remove_column :reports, :latitude
    remove_column :reports, :longitude
    remove_column :reports, :gmaps
  end

  def down
    add_columns :reports, :latitude, :string
    add_columns :reports, :longitude, :string
    add_columns :reports, :gmaps, :boolean
  end
end
