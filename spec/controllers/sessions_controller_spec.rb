require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:password) { 'PassworD.1!1' }
  let(:user) do
    User.new(
      name: 'Valid User',
      email: 'valid.email@example.com',
      password: password,
      password_confirmation: password
    )
  end

  describe 'GET #new' do
    context 'when user is logged in' do
      before do
        session[:user_email] = user.email
        get :new
      end

      it 'redirects to profile' do
        expect(response).to redirect_to(profile_path)
      end
    end

    context 'when user is not logged in' do
      before { get :new }

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid credentials' do
      before do
        user.save
        post :create, params: { session: { email: user.email, password: password } }
      end

      it 'sets the session user_email' do
        expect(session[:user_email]).to eq(user.email)
      end

      it 'redirects to profile' do
        expect(response).to redirect_to(profile_path)
      end

      it 'sets a success notice' do
        expect(flash[:notice]).to eq(I18n.t('sessions.create.success'))
      end
    end

    context 'with invalid credentials' do
      before do
        user.save
        post :create, params: { session: { email: user.email, password: 'WrongPassword' } }
      end

      it 'does not set the session user_email' do
        expect(session[:user_email]).to be_nil
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it 'sets an alert message' do
        expect(flash[:alert]).to eq(I18n.t('sessions.create.failure'))
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      session[:user_email] = user.email
      delete :destroy
    end

    it 'resets the session' do
      expect(session[:user_email]).to be_nil
    end

    it 'redirects to login' do
      expect(response).to redirect_to(login_path)
    end

    it 'sets a success notice' do
      expect(flash[:notice]).to eq(I18n.t('sessions.destroy.success'))
    end
  end
end
