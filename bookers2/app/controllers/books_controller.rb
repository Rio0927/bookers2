class BooksController < ApplicationController
before_action :authenticate_user!

   def create
   @user = current_user
   @book = Book.new(book_params)
   @book.user_id = current_user.id
      if @book.save
         flash[:notice] = "You have created book successfully"
         redirect_to book_path(@book.id)
      else
         @books=Book.all
         render :index
      end
   end

   def show
      @book1=Book.new
      @book=Book.find(params[:id])
      @user=@book.user
   end

   def destroy
      book=Book.find(params[:id])
      book.destroy
      redirect_to books_path
      flash[:notice]='Book was successfully destroyed'
   end

   def update
   @book=Book.find(params[:id])
      if @book.update(book_params)
         redirect_to book_path(@book.id)
         flash[:notice]='Book was successfully updated'
      else
         render :edit
      end
   end

   def edit
      @book=Book.find(params[:id])
         if current_user == @book.user
         else
            redirect_to books_path
         end
   end

   def index
      @book=Book.new
      @books=Book.all
      @user=current_user
   end

   private
   def book_params
    params.require(:book).permit(:title, :body)
   end
end
