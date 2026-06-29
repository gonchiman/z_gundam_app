class UsersController < ApplicationController
  skip_before_action :require_authentication, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_session_path, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.expect(user: [:name, :email_address, :password])
  end
end