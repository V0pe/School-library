require './person'
require './book'

class Rentals
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date

    # many to many relationships for person and books
    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
