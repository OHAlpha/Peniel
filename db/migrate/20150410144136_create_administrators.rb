class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.integer :user_id
      t.text :description
      t.integer :permissions

      t.timestamps null: false
    end
  end
end
