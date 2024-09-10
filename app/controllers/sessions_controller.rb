class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_email] = user.email
      redirect_to profile_path, notice: I18n.t('sessions.create.success')
    else
      flash[:alert] = I18n.t('sessions.create.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session

    redirect_to login_path, notice: I18n.t('sessions.destroy.success')
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
