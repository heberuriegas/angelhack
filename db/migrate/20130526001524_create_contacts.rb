class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :title
      t.references :type
      t.references :venue

      t.timestamps
    end
    add_index :contacts, :type_id
    add_index :contacts, :venue_id
  end
end
