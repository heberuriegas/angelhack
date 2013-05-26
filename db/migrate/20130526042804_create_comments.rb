class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.references :report
      t.references :user

      t.timestamps
    end
    add_index :comments, :report_id
    add_index :comments, :user_id
  end
end
