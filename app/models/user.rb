require 'bcrypt'

class User
  include ActiveModel::Model
  include ActiveModel::Validations
  include BCrypt
  include EmailValidator
  include PasswordValidator

  attr_accessor :name, :email, :password, :password_confirmation, :password_digest

  validates :name, presence: true, length: { in: 5..128 }
  validates :email, presence: true, length: { maximum: 128 }
  validates :password, presence: true, length: { minimum: 10 }, confirmation: true

  @@users = []

  def initialize(attributes = {})
    @name = attributes[:name]
    @password = attributes[:password]
    @password_confirmation = attributes[:password_confirmation]
    @email = attributes[:email]
  end

  def self.all
    @@users
  end

  def self.find_by_email(email)
    @@users.find { |user| user.email == email }
  end

  def save
    if valid?
      self.password_digest = Password.create(password)
      @@users << self
      true
    else
      false
    end
  end

  def authenticate(password)
    Password.new(password_digest) == password
  end
end
