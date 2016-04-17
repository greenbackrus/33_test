class Course < ActiveRecord::Base
  has_many :disciplines
  has_many :lessons, through: :disciplines

  def create_disciplines(list)
    # для каждой строки текста, переданного из формы, создаем объект дисциплины с наименованием
    # равным этой строке, а также объект урока (1 неделя) и объекты домашнего задания и лекции
    unless list.nil?
      list.each_line do |title|
        newbie = self.disciplines.create({title: title})
        if newbie.save
          lesson_newbie = newbie.lessons.create({week: 1})
        end
        if lesson_newbie.save
          l =   lesson_newbie.lections.create
          hw =  lesson_newbie.homeworks.create
          l.save
          hw.save
        end
      end
    end
  end
end
