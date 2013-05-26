class AddVenueIdToReports < ActiveRecord::Migration
  def change
    add_column :reports, :venue_id, :integer
  end
end
