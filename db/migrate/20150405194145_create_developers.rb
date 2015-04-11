class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.integer :user_id
      t.text :description
      t.integer :permissions

      t.timestamps null: false
    end
  end
end
