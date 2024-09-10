require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) do
    User.new(
      name: 'Valid User',
      email: 'valid.email@example.com',
      password: 'PassworD.1!1',
      password_confirmation: 'PassworD.1!1'
    )
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(5).is_at_most(128) }
    it { should validate_presence_of(:email) }
    it { should allow_value('valid.email@example.com').for(:email) }
    it { should_not allow_value('invalid.email').for(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(10) }
  end

  describe 'class methods' do
    before do
      valid_user.save
    end

    it '.all returns all users' do
      expect(User.all).to include(valid_user)
    end

    it '.find_by_email returns the user with the given email' do
      found_user = User.find_by_email('valid.email@example.com')

      expect(found_user.email).to eq(valid_user.email)
      expect(found_user.name).to eq(valid_user.name)
      expect(found_user.authenticate('PassworD.1!1')).to be true
    end
  end

  describe 'instance methods' do
    it '#save saves the user if valid' do
      expect(valid_user.save).to be true
      expect(User.all).to include(valid_user)
    end

    it '#save does not save the user if invalid' do
      valid_user.email = ''

      expect(valid_user.save).to be false
      expect(User.all).not_to include(valid_user)
    end

    it '#authenticate returns true for correct password' do
      valid_user.save

      expect(valid_user.authenticate('PassworD.1!1')).to be true
    end

    it '#authenticate returns false for incorrect password' do
      valid_user.save

      expect(valid_user.authenticate('WrongPassword')).to be false
    end
  end

  describe 'validations' do
    context 'email format' do
      it 'is valid with a correct email format' do
        user = User.new(
          name: 'Valid User',
          email: 'valid.email@example.com',
          password: 'PassworD.1!1',
          password_confirmation: 'PassworD.1!1'
        )
        expect(user).to be_valid
      end

      it 'is invalid with an incorrect local part' do
        user = User.new(email: 'invalid email.@example.com')

        expect(user).not_to be_valid
        expect(user.errors[:email]).to include(I18n.t('errors.messages.email_invalid'))
      end

      it 'is invalid with an incorrect domain' do
        user = User.new(email: 'invalid.email@example,com')

        expect(user).not_to be_valid
        expect(user.errors[:email]).to include(I18n.t('errors.messages.email_invalid'))
      end

      it 'is invalid with a blank email' do
        user = User.new(email: '')

        expect(user).not_to be_valid
        expect(user.errors[:email]).to include(I18n.t('activemodel.errors.models.user.attributes.email.blank'))
      end
    end

    context 'password format' do
      it 'is invalid with a short password' do
        user = User.new(password: 'Short1!', password_confirmation: 'Short1!')

        expect(user).not_to be_valid
        expect(user.errors[:password]).to include(I18n.t('errors.messages.password_length'))
      end

      it 'is invalid without enough digits' do
        user = User.new(password: 'Password!', password_confirmation: 'Password!')

        expect(user).not_to be_valid
        expect(user.errors[:password]).to include(I18n.t('errors.messages.password_digits'))
      end

      it 'is invalid without enough uppercase letters' do
        user = User.new(password: 'password123!', password_confirmation: 'password123!')

        expect(user).not_to be_valid
        expect(user.errors[:password]).to include(I18n.t('errors.messages.password_uppercase'))
      end

      it 'is invalid without enough lowercase letters' do
        user = User.new(password: 'PASSWORD123!', password_confirmation: 'PASSWORD123!')

        expect(user).not_to be_valid
        expect(user.errors[:password]).to include(I18n.t('errors.messages.password_lowercase'))
      end

      it 'is invalid without enough special characters' do
        user = User.new(password: 'Password123', password_confirmation: 'Password123')

        expect(user).not_to be_valid
        expect(user.errors[:password]).to include(I18n.t('errors.messages.password_special'))
      end
    end
  end
end
