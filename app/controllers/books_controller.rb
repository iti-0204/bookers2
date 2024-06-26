class BooksController < ApplicationController
  def new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = User.find(current_user.id)
      # flash[:notice] = "error : You have not created book successfully."
      render :index
    end
  end

  def index
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end

  def show
    # @user = User.find(current_user.id)
    @book = Book.new
    @target_book = Book.find(params[:id])
    @user = @target_book.user
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
