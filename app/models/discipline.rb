class Discipline < ActiveRecord::Base
  belongs_to :course
  has_many :lessons
end
