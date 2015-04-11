class CreateBibleLessons < ActiveRecord::Migration
  def change
    create_table :bible_lessons do |t|
      t.string :title
      t.string :subject
      t.integer :category_id
      t.integer :author_id
      t.text :tags
      t.text :lesson

      t.timestamps null: false
    end
  end
end
