# spec/models/example_spec.rb

require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      book = Book.new(title: 'Harry Potter')
      expect(book).to be_valid
    end
  end
  end
