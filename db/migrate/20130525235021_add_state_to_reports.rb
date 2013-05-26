class AddStateToReports < ActiveRecord::Migration
  def change
  	add_column :reports, :state, :string, :default=> 1
  end
end
