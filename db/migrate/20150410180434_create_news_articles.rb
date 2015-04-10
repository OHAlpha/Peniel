class CreateNewsArticles < ActiveRecord::Migration
  def change
    create_table :news_articles do |t|
      t.string :title
      t.string :subject
      t.integer :category_id
      t.integer :author_id
      t.date :date
      t.text :tags
      t.text :article

      t.timestamps null: false
    end
  end
end
