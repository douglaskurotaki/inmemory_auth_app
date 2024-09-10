module PasswordValidator
  extend ActiveSupport::Concern

  included do
    validate :password_rules
  end

  private

  def password_rules
    return if password.blank?

    errors.add(:password, I18n.t('errors.messages.password_length')) unless password.length.between?(10, 72)
    errors.add(:password, I18n.t('errors.messages.password_digits')) unless password.scan(/\d/).size >= 2
    errors.add(:password, I18n.t('errors.messages.password_uppercase')) unless password.scan(/[A-Z]/).size >= 2
    errors.add(:password, I18n.t('errors.messages.password_lowercase')) unless password.scan(/[a-z]/).size >= 2
    errors.add(:password, I18n.t('errors.messages.password_special')) unless password.scan(/[^A-Za-z0-9]/).size >= 2
  end
end
