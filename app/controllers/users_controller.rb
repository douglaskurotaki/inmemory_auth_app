class UsersController < ApplicationController
  before_action :redirect_to_login, only: %i[profile], if: -> { session[:user_email].nil? }
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice:  I18n.t('users.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def profile
    @user = User.find_by_email(session[:user_email])
    @location = IpinfoGateway.fetch_location
  end

  private

  def redirect_to_login
    redirect_to login_path
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
