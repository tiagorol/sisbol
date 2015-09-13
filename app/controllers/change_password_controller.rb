class ChangePasswordController < ApplicationController
  before_action :validate_current_password, only: [:change]
  before_action :validate_password, only: [:change]
  before_action :validate_confirmation_password, only: [:change]

  def new
  end

  def change
    new_password = params[:change_password][:new_password]
    @user.update(password: new_password)
    flash.now[:notice] = t(:message_updated)
    render 'new'
  end

  private

    def validate_password
      new_password = params[:change_password][:new_password]

      if new_password.length < 5 || new_password.length > 100
        flash.now[:error] = t(:message_validate_length_password)
        render 'new'
      end
    end

    def validate_confirmation_password
      new_password = params[:change_password][:new_password]
      confirmation_password = params[:change_password][:confirmation_password]

      if !new_password.eql?confirmation_password
        flash.now[:error] = t(:message_validate_confirmation_password)
        render 'new'
      end
    end

    def validate_current_password
      current_password = params[:change_password][:current_password]
      @user = User.find(session[:user_id])

      if !@user.authenticate(current_password)
        flash.now[:error] = t(:message_validate_current_password)
        render 'new'
      end
    end

end
