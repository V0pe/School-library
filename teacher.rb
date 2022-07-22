require './person'

class Teacher < Person
  def initialize(age, specialization, parent_permission, name = 'Unknown')
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def can_use_services
    true
  end
end
