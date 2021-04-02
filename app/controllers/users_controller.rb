class UsersController < ApplicationController
  def show
    @user = User.find
  end

  def new; end

  def create; end

  private

  def user_params
    permit(:user)
  end
end
