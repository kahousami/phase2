class UsersController < ApplicationController

before_action :authenticate_user!

  def show
  	@book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user), notice: "userinfo was successfully updated"
  else
    render :edit
  end
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
