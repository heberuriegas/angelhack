class AddTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :validate_token, :integer
  end
end
