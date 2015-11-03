module SessionsHelper
  def create_session(user)
    session[:user_id] = user.id # => sets the session objects :user_id param equal to user.id which means it will always be unique for every user
    # is this basically saying the session object with a hash key of :user_id ?
  end

  def destroy_session(user)
    session[:user_id] = nil # => sets the session :user_id to nil which means that it is untrackable ie. logged out
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def avatar_url(user)
     gravatar_id = Digest::MD5::hexdigest(user.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end
end
