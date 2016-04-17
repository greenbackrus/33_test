class Lesson < ActiveRecord::Base
  has_many :lections
  has_many :homeworks
  belongs_to :discipline

# выбирает уроки, которые соответствуют определенному курсу, группируем их по неделям их проведения
#  scope :by_course, -> (course_id) {where('course_id = ?', course_id).group('week')}

end
