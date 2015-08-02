class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  include SessionsHelper

  protected
    def authenticate_user!
      if !user_authenticated
        redirect_to login_path
      end
    end

    def user_authenticated
      !session[:user_id].nil?
    end

end
