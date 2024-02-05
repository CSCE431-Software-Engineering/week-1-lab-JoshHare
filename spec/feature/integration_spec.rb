
# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  it 'valid input with all attributes' do
    visit new_book_path
    fill_in 'book[title]', with: 'Harry Potter'
    fill_in 'book[author]', with: 'J.K. Rowling'
    fill_in 'book[price]', with: '19.99'
    fill_in 'book[publishDate]', with: '2001-06-26'
    click_on 'Add Book'
    expect(page).to have_content("Book successfully created!")
  end

  it 'invalid input without title' do
    visit new_book_path
    fill_in 'book[author]', with: 'J.K. Rowling'
    fill_in 'book[price]', with: '19.99'
    fill_in 'book[publishDate]', with: '2001-06-26'
    click_on 'Add Book'
    expect(page).to have_content("Book could not be created!")
  end

  it 'invalid input without author' do
    visit new_book_path
    fill_in 'book[title]', with: 'Harry Potter'
    fill_in 'book[price]', with: '19.99'
    fill_in 'book[publishDate]', with: '2001-06-26'
    click_on 'Add Book'
    expect(page).to have_content("Book could not be created!")
  end

  it 'invalid input without price' do
    visit new_book_path
    fill_in 'book[title]', with: 'Harry Potter'
    fill_in 'book[author]', with: 'J.K. Rowling'
    fill_in 'book[publishDate]', with: '2001-06-26'
    click_on 'Add Book'
    expect(page).to have_content("Book could not be created!")
  end

  it 'invalid input without publish date' do
    visit new_book_path
    fill_in 'book[title]', with: 'Harry Potter'
    fill_in 'book[author]', with: 'J.K. Rowling'
    fill_in 'book[price]', with: '19.99'
    click_on 'Add Book'
    expect(page).to have_content("Book could not be created!")
  end
end
