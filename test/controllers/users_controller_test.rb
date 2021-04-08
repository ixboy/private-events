require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
   setup do
    @user = users(:one)
  end
   test 'should get new' do
    get sign_up_path
    assert_response :success
  end
end
