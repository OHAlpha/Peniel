class BibleLesson < ActiveRecord::Base

  belongs_to :category, class_name: 'BibleLessonCategory'
  belongs_to :author, class_name: 'User'

end
