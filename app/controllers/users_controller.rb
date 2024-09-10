class UsersController < ApplicationController
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

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
