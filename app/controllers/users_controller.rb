require 'digest/sha1'

class UsersController < ApplicationController
  before_filter :has_permission_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.password = Digest::SHA1.hexdigest(@user.password)
    @user.password_confirmation = Digest::SHA1.hexdigest(@user.password_confirmation)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t(:message_created) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params_update)
        format.html { redirect_to @user, notice: t(:message_updated) }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: t(:message_destroyed) }
      format.json { head :no_content }
    end
  end

  private

    def user_params_update
      password = params[:user][:password]
      if password.blank?
        password = @user.password
        password_confirmation = @user.password
      else
        password = Digest::SHA1.hexdigest(params[:user][:password])
        password_confirmation = Digest::SHA1.hexdigest(params[:user][:password_confirmation])
      end
      params.require(:user).permit(:name, :surname, :date_of_birth, :email, :password, :password_confirmation, :avatar).merge(password: password, password_confirmation: password_confirmation)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :surname, :date_of_birth, :email, :password, :password_confirmation, :avatar)
    end
end
