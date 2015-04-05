class AddSaltPasshashToUsers < ActiveRecord::Migration
  def change
    add_column :users, :salt_passhash, :string
  end
end
