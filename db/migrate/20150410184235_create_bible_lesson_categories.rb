class CreateBibleLessonCategories < ActiveRecord::Migration
  def change
    create_table :bible_lesson_categories do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
