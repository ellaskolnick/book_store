require_relative '../lib/book.rb'

class BookRepository

  # Selecting all records
  # No arguments
  def all
    sql = 'SELECT * FROM books;'
    result_set = DatabaseConnection.exec_params(sql, [])

    books = []

    result_set.each do |record|
      book = Book.new
      book.id = record['id']
      book.title = record['title']
      book.author_name = record['author_name']
      books << book
    end

    books
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  # def find(id)
  #   # Executes the SQL query:
  #   # SELECT id, name, cohort_name FROM students WHERE id = $1;

  #   # Returns a single Student object.
  # end

  # Add more methods below for each operation you'd like to implement.

  # def create(student)
  # end

  # def update(student)
  # end

  # def delete(student)
  # end
end
