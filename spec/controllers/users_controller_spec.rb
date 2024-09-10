require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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
    before { get :new }

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          user: {
            name: 'Valid User',
            email: 'valid.email@example.com',
            password: password,
            password_confirmation: password
          }
        }
      end

      it 'creates a new user' do
        expect {
          post :create, params: valid_params
        }.to change(User.all, :count).by(1)
      end

      it 'redirects to login path with a success notice' do
        post :create, params: valid_params

        expect(response).to redirect_to(login_path)
        expect(flash[:notice]).to eq(I18n.t('users.created'))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          user: {
            name: '',
            email: 'invalid.email',
            password: 'short',
            password_confirmation: 'short'
          }
        }
      end

      it 'does not create a new user' do
        expect {
          post :create, params: invalid_params
        }.not_to change(User.all, :count)
      end

      it 'renders the new template with unprocessable entity status' do
        post :create, params: invalid_params

        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #profile' do
    context 'when user is not logged in' do
      before { get :profile }

      it 'redirects to login path' do
        expect(response).to redirect_to(login_path)
      end
    end

    context 'when user is logged in' do
      before do
        user.save
        session[:user_email] = user.email

        allow(IpinfoGateway).to receive(:fetch_location).and_return('Some Location')

        get :profile
      end

      it 'renders the profile template' do
        expect(response).to render_template(:profile)
      end
    end
  end
end
