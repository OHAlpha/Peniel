class NewsArticleUserTag < ActiveRecord::Base

  belongs_to :news_article
  belongs_to :user

end
