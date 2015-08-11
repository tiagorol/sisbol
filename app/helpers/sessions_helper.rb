module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    session[:user_name] = user.name
    save_last_acesss user
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    session.delete(:user_name)
    @current_user = nil
  end

  private

    def save_last_acesss user
      access = Access.new(user_id: user.id, date: DateTime.now)
      access.save
    end

end
