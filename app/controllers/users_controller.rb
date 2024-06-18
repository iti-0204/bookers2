class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @users = User.all
  end

  def edit
  end


  
end
