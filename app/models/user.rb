class User < ApplicationRecord
  def index; end

  def new; end

  def create; end

  private

  def user_params
    permit(:user)
  end
end
