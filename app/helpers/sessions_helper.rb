module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    session[:user_name] = user.name
    store_last_access_session user
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

    def store_last_access_session user
      access = Access.last
      save_last_access user
      if(access == nil)
        access = Access.last
      end
      session[:last_access] = l(access.date, format: :long)
    end

    def save_last_access user
      access = Access.new(user_id: user.id, date: DateTime.now)
      access.save
    end

end
