require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'email validation should trigger' do
    assert_not User.new(username: 'username', password: 'password', password_confirmation: 'password').save
  end
  test 'user should save' do
    assert User.new(username: 'username', email: 'hello@gmail.com', password: 'password',
                    password_confirmation: 'password').save
  end
end
