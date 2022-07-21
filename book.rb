require './rentals'

class Bo
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # add the rentals and a book has many rentals
  def add_rental(date, person)
    Rental.new(date, person, self)
  end
end
