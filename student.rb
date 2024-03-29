require './person'
require './classroom'

class Student < Person
  # The classroom writer has been defined below
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission = 'true')
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
