require 'book_repository'

RSpec.describe BookRepository do
  def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_books_table
  end

  it "lists all of the books in the store" do
    repo = BookRepository.new

    books = repo.all
    expect(books.length).to eq 2
  end

  it "returns the title of the first book" do
    repo = BookRepository.new

    books = repo.all
    expect(books[0].title).to eq "Daisy Jones and The Six"
  end

  it "returns the author of the first book" do
    repo = BookRepository.new

    books = repo.all
    expect(books[0].author_name).to eq "Taylor Jenkins Reid"
  end
end
