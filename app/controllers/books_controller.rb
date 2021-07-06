class BooksController < ApplicationController

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user

  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(current_user.id)
  end


 private

 def book_params
   params.require(:book).permit(:title, :body)
 end
end
