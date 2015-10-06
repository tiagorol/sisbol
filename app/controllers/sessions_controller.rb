class SessionsController < ApplicationController
  layout "login"
  skip_before_filter :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = t(:invalid_login)
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

end
