require './book'
require './person'
require './teacher'
require './student'
require './rentals'

class App
  # lists all books
  def all_books
    Book.all.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  # list people
  def all_people
    Person.all.each do |person|
      puts "[#{person.class.name}], Name: #{person.name}, ID: #{person.id},Age: #{person.age}"
    end
  end

  # create student
  def create_student
    print 'Age : '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission [Y/N]'
    permission = gets.chomp
    permission = permission.upcase!
    case permission
    when permission == 'Y'
      permission = true
    when permission == 'N'
      permission = false
    end
    Student.new(age, 'Great', name, permission)
    puts 'Person Created successfully'
  end

  # create teacher
  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'name: '
    name = gets.chomp
    print 'specialization:'
    spec = gets.chomp
    Teacher.new(age, spec, true, name)
    puts 'Person Created successfully'
  end

  # person_select
  def person_select
    puts 'Do you want to create a (1) student or a (2) teacher: '
    person_input = gets.chomp.to_i
    case person_input
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  # create book
  def create_book
    print 'title of the book:'
    title = gets.chomp
    print 'author of the book:'
    author = gets.chomp
    Book.new(title, author)
    puts 'Book Created successfully'
  end

  # add rentals
  def add_rentals
    puts 'Select a book from the following list by number'
    Book.all.each_with_index do |key, index|
      puts "#{index}) Title: #{key.title}, Author: #{key.author}"
    end
    book_select = gets.chomp.to_i
    puts 'Select a person from the following list by number'
    Person.all.each_with_index do |key, index|
      puts "#{index}), [#{key.class.name}], Name: #{key.name}, ID: #{key.id},Age: #{key.age}"
    end
    person_select = gets.chomp.to_i
    puts 'YYYY/MM/DD'
    print 'Date: '
    date = gets.chomp
    Rentals.new(date, Person.all[person_select], Book.all[book_select])
    puts 'Rental Created successfully'
  end

  # list rentals
  def list_rentals
    print 'ID of the person: '
    id_select = gets.chomp.to_i
    rental_select = Rentals.all.select { |rental| rental.person.id == id_select }
    puts 'Rentals'

    puts 'No rentals found' if rental_select.empty?
    rental_select.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
    puts '    '
  end
end
