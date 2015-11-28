class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  include SessionsHelper
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  helper_method :user_admin

  def user_admin
    session[:role].eql?("admin")
  end

  private
    def user_not_authorized
      flash[:alert] = t(:message_permission_admin)
      redirect_to(request.referrer || root_path)
    end

  protected
    def authenticate_user!
      if !user_authenticated
        redirect_to login_path
      end
    end

    def user_authenticated
      !session[:user_id].nil?
    end

    def has_permission_admin
      if !session[:role].eql?("admin")
        raise Pundit::NotAuthorizedError
      end
    end

end
