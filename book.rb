require './rentals'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # add the rentals and a book has many rentals
  def add_rental(date, person)
    Rental.new(date, person, self)
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
