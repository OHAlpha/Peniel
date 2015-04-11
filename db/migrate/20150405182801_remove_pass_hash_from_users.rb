class RemovePassHashFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :passhash, :string
  end
end
