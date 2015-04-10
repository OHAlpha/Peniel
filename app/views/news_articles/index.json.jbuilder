json.array!(@news_articles) do |news_article|
  json.extract! news_article, :id, :title, :subject, :category_id, :author_id, :tags, :article
  json.url news_article_url(news_article, format: :json)
end
