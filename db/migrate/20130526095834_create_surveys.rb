class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.references :report
      t.references :response

      t.timestamps
    end
    add_index :surveys, :report_id
    add_index :surveys, :response_id
  end
end
