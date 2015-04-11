class NewsArticle < ActiveRecord::Base

  belongs_to :category, class_name: 'NewsCategory'
  has_many :user_tags, class_name: 'NewsArticleUserTag'

end
