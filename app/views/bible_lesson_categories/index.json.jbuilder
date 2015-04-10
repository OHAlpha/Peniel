json.array!(@bible_lesson_categories) do |bible_lesson_category|
  json.extract! bible_lesson_category, :id, :name, :description
  json.url bible_lesson_category_url(bible_lesson_category, format: :json)
end
