class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book successfully created!"
      redirect_to books_path
    else
      #assign instance variables needed
      flash[:notice] = "Book could not be created!"
      redirect_to books_path #new action not being called, just renders new template in view
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book successfully updated!"
      redirect_to book_path(@book)
    else
      flash[:notice] = "Book could not be updated!"
      redirect_to books_path
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book successfully destroyed!"
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :price, :publishDate)
  end

end
