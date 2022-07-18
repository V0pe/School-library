class Person
  def initialize(age, parent_permission, name = 'Unknown')
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services
    @parent_permission || is_of_age?
  end

  private

  def is_of_age?
    @age >= 18
  end
end

person1 = Person.new(23, false, 'Dele')

p person1.can_use_services
p person1.name
p person1.age
p person1.is_of_age
