class AddCategoriesVenues < ActiveRecord::Migration
  def up
    create_table :categories_venues do |t|
      t.references :category
      t.references :venue
    end
  end

  def down
    drop_table :categories_venues
  end
end
