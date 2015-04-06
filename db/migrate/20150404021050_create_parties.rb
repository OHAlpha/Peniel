class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name, null: false
      t.index :name, unique: true
      t.text :description

      t.timestamps null: false
    end
  end
end
