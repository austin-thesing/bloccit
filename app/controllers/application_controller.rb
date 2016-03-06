class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper # => so that we can access this in every controller that we write
  include RandomData # => didn't want to keep having to write this in ever new spec
  private # only add private methods below this

  def require_sign_in
    unless current_user
      flash[:error] = "You must be logged in to do that."
      redirect_to new_session_path
    end
  end

end
