class UsersController < ApplicationController
before_action :authenticate_user!

   def index
      @book=Book.new
      @user=current_user
      @users=User.all
   end

   def create
   end

   def show
      @book1=Book.new
      @user=User.find(params[:id])
      @books=@user.books
   end

   def edit
      @user=User.find(params[:id])
      if @user == current_user
      else
         redirect_to user_path(current_user.id)
      end
   end

   def update
   @user = User.find(params[:id])
      if @user.update(user_params)
         flash[:success]='User was successfully updated'
         redirect_to user_path(@user.id)
      else
         render :edit
      end
   end

   private
   def user_params
    params.require(:user).permit(:name, :introduction, :image)
   end
end