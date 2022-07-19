class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission=true)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services
    @parent_permission || is_of_age?
  end

  def correct_name
    @name
  end

  private

  def is_of_age? # rubocop:disable Naming/PredicateName
    @age >= 18
  end
end
