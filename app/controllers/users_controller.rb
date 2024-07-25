class UsersController < ApplicationController
  # before_action :authenticate_user, except: %i[create]
  require 'bcrypt'
  # has_secure_password
  before_action :authenticate_request, only: [:index, :update, :destroy]

  def index
    # http://127.0.0.1:3000/index?search=mission&page=1&per_page=10
    @users = User.search(params[:search])
                 .page(params[:page])
                 .per(params[:per_page] || 10)

    render json: {
      result: 'success',
      data: @users,
      meta: {
        total_count: @users.total_count,
        total_pages: @users.total_pages,
        current_page: @users.current_page,
        per_page: @users.limit_value
      }
    }
  end


  def create

    form = UserCreateForm.new(params)
    return error_validation(form.errors) if form.invalid?
    puts form.first_name

    @user = User.new
    @user.first_name = form.first_name
    @user.last_name = form.last_name
    @user.email = form.email
    @user.password = form.password
    @user.phone = form.phone
    @user.dob = form.dob
    @user.gender = form.gender
    @user.address = form.address
    return error_validation(@user.errors) if @user.invalid?
    @user.save!
  end

  # update
  def update
    form = UserUpdateForm.new(params)
    error_validation(form.errors) if form.invalid?

    @users = @current_user

    @users.first_name = form.first_name unless form.first_name.nil?
    @users.last_name = form.last_name unless form.last_name.nil?
    @users.email = form.email unless form.email.nil?

    @users.phone = form.phone unless form.phone.nil?
    @users.dob = form.dob unless form.dob.nil?
    @users.gender = form.gender unless form.gender.nil?
    @users.address = form.address unless form.address.nil?

    return error_validation(@users.errors) if @users.invalid?

    @users.save!
  end

  # delete
  def destroy
    @users = @current_user
    @users.destroy
  end

  private

end




