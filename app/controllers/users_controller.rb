class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      create_session(@user) # => signs in new users after signup
      redirect_to root_path
    else
      flash[:error] = "There was an error creating your account. Please try again."
      render :new # => keeps your user account information in the form even if there has been an error
    end
  end
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.visible_to(current_user)
  end
end
