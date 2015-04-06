class CreatePeople < ActiveRecord::Migration
  def change
    create_table :persons do |t|
      t.string :name, null: false
      t.string :email

      t.timestamps null: false
    end
  end
end
