json.array!(@bible_lessons) do |bible_lesson|
  json.extract! bible_lesson, :id, :title, :subject, :category_id, :author_id, :tags, :lesson
  json.url bible_lesson_url(bible_lesson, format: :json)
end
