require './book'
require './person'
require './teacher'
require './student'
require './book'
require './rentals'


class App
  #lists all books
  def all_books
    Book.all.map { |book| puts 'Title: #{book.title}, Author: #{book.author}'}
  end
  #list people
  def all_people
    Person.all.each { |person| p "[#{person.class.name}], Name: #{person.name}, ID: #{person.id},Age: #{person.age}"}
  end
 
  #create student
  def create_student
    puts "Age"
    age = gets.chomp
    puts "name"
    name = gets.chomp
    puts "Has parent permission [Y/N]"
    permission = gets.chomp
    permission  = permission.upcase!
    case permission
      when permission === 'Y'
        permission = true
      when permission === 'N'
        permission = false
    end
    Student.new(age, "Great", name, permission)
    p "Person Created successfully"
  end

  #create teacher
  def create_teacher
    puts "Age"
    age = gets.chomp
    puts "name"
    name = gets.chomp
    puts "specialization"
    spec = gets.chomp
    Teacher.new(age, spec,true, name)
    p "Person Created successfully"
  end
  #create book
  def create_book
    puts "title of the book"
    title = gets.chomp
    puts "author of the book"
    author = gets.chomp
    Book.new(title, author)
    p "Book Created successfully"
  end
end
