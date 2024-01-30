class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :publishDate, presence: true
  validates :price, presence: true
end
