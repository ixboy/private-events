class MainController < ApplicationController
  def index
    flash.now[:notice] = 'logged in successfully...'
    flash.now[:alert] = 'something happened'
  end
end
