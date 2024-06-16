class BooksController < ApplicationController
  def new
    
  end

  def index
    @user = User.find(current_user.id)
    @books = @user.books
    @book = Book.new
  end

  def show
  end
end
