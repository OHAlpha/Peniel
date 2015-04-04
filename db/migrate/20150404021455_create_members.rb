class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_id
      t.date :since

      t.timestamps null: false
    end
  end
end
