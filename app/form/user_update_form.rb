class UserUpdateForm
  include ActiveModel::Model

  attr_accessor :first_name,
                :last_name,
                :email,
                :password,
                :phone,
                :dob,
                :gender,
                :address

  validates :first_name, length: { in: 1..25, allow_blank: true }
  validates :last_name, length: { in: 1..25, allow_blank: true }
  validates :email, length: { in: 5..255, allow_blank: true }
  validates :phone, length: { in: 1..10, allow_blank: true }
  validates :dob, length: { in: 1..20, allow_blank: true }
  validates :gender, inclusion: { in: %w(male female), message: "%{value} is not included in the list" }, allow_blank: true
  validates :address,  length: { in: 5..100, allow_blank: true }


  def initialize(params = {})
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @email = params[:email]
    @password = params[:password]
    @phone = params[:phone]
    @dob = params[:dob]
    @gender = params[:gender]
    @address = params[:address]

  end
end