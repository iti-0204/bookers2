class BooksController < ApplicationController
  def new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @user = User.find(current_user.id)
    @books = @user.books
    @book = Book.new
  end

  def show
    @user = User.find(current_user.id)
    @book = Book.new
    @target_book = Book.find(params[:id])
  end

  def edit

  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
