require './rentals'

class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = 'true')
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def can_use_services
    @parent_permission || is_of_age?
  end

  def correct_name
    @name
  end

  # has many rentals, a person has many rentals
  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  private

  def is_of_age? # rubocop:disable Naming/PredicateName
    @age >= 18
  end
end
