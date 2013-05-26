class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :content
      t.references :question

      t.timestamps
    end
    add_index :responses, :question_id
  end
end
