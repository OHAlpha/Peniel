class AddPermissionsToMembers < ActiveRecord::Migration
  def change
    add_column :members, :permissions, :integer
  end
end
