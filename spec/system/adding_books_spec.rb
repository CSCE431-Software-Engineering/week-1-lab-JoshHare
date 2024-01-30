require 'rails_helper'

RSpec.describe "AddingBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

#  pending "add some scenarios (or delete) #{__FILE__}"
  it 'adds a book to collection' do
    visit '/books/new'
    fill_in 'book[title]', with: 'Hello, World!'
    click_on 'Add Book'
    expect(page).to have_content('Book successfully created!')
    post = Book.order("id").last
    expect(post.title).to eq('Hello, World!')
  end
end
