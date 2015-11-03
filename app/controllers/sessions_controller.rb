class SessionsController < ApplicationController
  def New

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) # => searches the DB for a user email in the params hash. Email is downcased so that it matches format of database.

    if user && user.authenticate(params[:session][:password])
      create_session user # => calls #create_session in sessions_helper.rb
      flash[:notice] = "Welcome #{user.name}"
      redirect_to root_path # => takes us back to the home page or welcome#index view
    else
      flash[:error] = "Invalid username/password. Please try again."
      render :new
    end
  end

  def destroy
    destroy_session(current_user) # => calls #destroy_session in sessions_helper.rb
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path # => takes us back to the home page or welcome#index view
  end

end
