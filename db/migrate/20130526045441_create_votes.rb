class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :report
      t.references :user
      t.boolean :calification

      t.timestamps
    end
    add_index :votes, :report_id
    add_index :votes, :user_id
    add_index :votes, [:report_id, :user_id], unique: true
  end
end
