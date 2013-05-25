class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.string :content
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
