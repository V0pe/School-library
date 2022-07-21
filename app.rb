require './book'
require './person'
require './teacher'
require './student'
require './book'
require './rentals'


class App
  #lists all books
  def all_books
    Book.all.map { |book| puts "Title: #{book.title}, Author: #{book.author}"}
  end
  #list people
  def all_people
    Person.all.each { |person| puts "[#{person.class.name}], Name: #{person.name}, ID: #{person.id},Age: #{person.age}"}
  end
 
  #create student
  def create_student
    print 'Age : '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission [Y/N]'
    permission = gets.chomp
    permission  = permission.upcase!
    case permission
      when permission === 'Y'
        permission = true
      when permission === 'N'
        permission = false
    end
    Student.new(age, "Great", name, permission)
    puts 'Person Created successfully'
  end

  #create teacher
  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'name: '
    name = gets.chomp
    print 'specialization:'
    spec = gets.chomp
    Teacher.new(age, spec,true, name)
    puts 'Person Created successfully'
  end
  #create book
  def create_book
    print 'title of the book:'
    title = gets.chomp
    print 'author of the book:'
    author = gets.chomp
    Book.new(title, author)
    puts 'Book Created successfully'
  end

  #add rentals
  def add_rentals
    puts "Select a book from the following list by number"
    Book.all.each_with_index { |key, index|
    puts "#{index}) Title: #{key.title}, Author: #{key.author}"}
    bookSelect = gets.chomp.to_i
    puts "Select a person from the following list by number"
    Person.all.each_with_index { |key, index|
    puts "#{index}), [#{key.class.name}], Name: #{key.name}, ID: #{key.id},Age: #{key.age}"}
    personSelect = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    Rentals.new(date, Person.all[personSelect], Book.all[bookSelect])
    puts 'Rental Created successfully'
  end

  #list rentals
  def list_rentals
    print 'ID of the person: '
    idSelect = gets.chomp.to_i
    rentalSelect = Rentals.all.select { |rental| rental.person.id == idSelect}
    puts 'Rentals'

    if rentalSelect.empty?
      puts "No rentals found"
    end
    rentalSelect.each {| rental| 
    puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"}
    puts "    "
  end
end
