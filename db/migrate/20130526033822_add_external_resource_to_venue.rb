class AddExternalResourceToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :external_type, :string
    add_column :venues, :external_id, :string
  end
end
