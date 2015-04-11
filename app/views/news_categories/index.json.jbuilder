json.array!(@news_categories) do |news_category|
  json.extract! news_category, :id, :namt, :description
  json.url news_category_url(news_category, format: :json)
end
