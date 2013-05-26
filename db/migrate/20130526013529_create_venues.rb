class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :image
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :postalcode
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
