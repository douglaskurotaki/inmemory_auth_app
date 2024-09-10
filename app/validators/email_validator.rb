module EmailValidator
  extend ActiveSupport::Concern

  included do
    validate :email_format
  end

  private

  def email_format
    return if email.blank?

    local_part, domain = email.split('@', 2)
    unless valid_local_part?(local_part) && valid_domain?(domain)
      errors.add(:email, I18n.t('errors.messages.email_invalid'))
    end
  end

  def valid_local_part?(local_part)
    return false if local_part.nil? || local_part.length > 64

    local_part.match?(/\A[A-Za-z0-9!#$%&'*+\-\/=?^_`{|}~.]+\z/)
  end

  def valid_domain?(domain)
    return false if domain.nil? || domain.length > 128

    domain.match?(/\A[A-Za-z0-9.-]+\z/)
  end
end
