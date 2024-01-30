
# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  it 'valid input with title' do
    visit new_book_path
    fill_in 'book[title]', with: 'Harry Potter'
    click_on 'Add Book'
    visit books_path
    expect(page).to have_content('Harry Potter')
  end

  it 'valid input with author' do
    visit new_book_path
    fill_in 'book[author]', with: 'J.K. Rowling'
    click_on 'Add Book'
    visit books_path
    expect(page).to have_content('J.K. Rowling')
  end

  it 'valid input with price' do
    visit new_book_path
    fill_in 'book[price]', with: '19.99'
    click_on 'Add Book'
    visit books_path
    expect(page).to have_content('19.99')
  end

  it 'valid input with publishDate' do
    visit new_book_path
    fill_in 'book[publishDate]', with: '2001-06-26'
    click_on 'Add Book'
    visit books_path

    # Formatting the date based on how it's displayed in your application
    formatted_date = Date.parse('2001-06-26').strftime('%Y-%m-%d')
    expect(page).to have_content(formatted_date)
  end
end

