# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      book = Book.new(title: 'Harry Potter', author: 'J.K. Rowling', price: 19.99, publishDate: Date.today)
      expect(book).to be_valid
    end

    it 'is not valid without a title' do
      book = Book.new(author: 'J.K. Rowling', price: 19.99, publishDate: Date.today)
      expect(book).not_to be_valid
    end

    it 'is not valid without an author' do
      book = Book.new(title: 'Harry Potter', price: 19.99, publishDate: Date.today)
      expect(book).not_to be_valid
    end

    it 'is not valid without a price' do
      book = Book.new(title: 'Harry Potter', author: 'J.K. Rowling', publishDate: Date.today)
      expect(book).not_to be_valid
    end

    it 'is not valid without a publish date' do
      book = Book.new(title: 'Harry Potter', author: 'J.K. Rowling', price: 19.99)
      expect(book).not_to be_valid
    end
  end
end



