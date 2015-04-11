class CreateNewsArticleUserTags < ActiveRecord::Migration
  def change
    create_table :news_article_user_tags do |t|
      t.integer :article_id
      t.integer :user_id
      t.integer :type

      t.timestamps null: false
    end
  end
end
