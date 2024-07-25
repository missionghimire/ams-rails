require_relative '../../config/initializers/constants'
class UserCreateForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :email, :password, :dob, :gender, :address, :phone

  validates :first_name, presence: true, length: { in: 1..25 }
  validates :last_name, presence: true, length: { in: 1..25 }
  validates :email, length: { in: 5..255 }, format: {
    with: EMAIL_VALIDATION_FORMAT,
    message: "Email format incorrect."
  }
  validate :email_uniqueness
  validates :password, length: { in: 8..50 }, format: {
    with: PASSWORD_CONTAINS_FORMAT,
    message: "Password must include: 1 uppercase letter, 1 lowercase letter, and 1 digit."
  }
  validates :dob, presence: true
  validates :gender, inclusion: { in: %w(male female), message: "%{value} is not included in the list" }, allow_blank: true
  validates :address, presence: true, length: { in: 1..50 }

  def initialize(params = {})
    super()
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @email = params[:email]
    @password = params[:password]
    @dob = params[:dob]
    @gender = params[:gender]
    @address = params[:address]
    @phone = params[:phone]
  end
  private
  def email_uniqueness
    if User.exists?(email: email)
      errors.add(:email, 'has already been taken')
    end
    end
end
