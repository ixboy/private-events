require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensure username presence' do
      user = User.new(password: 'password', password_confirmation: 'password').save
      expect(user).to eq(false)
    end
    it 'ensure email presence' do
      user = User.new(username: 'username', password: 'password', password_confirmation: 'password').save
      expect(user).to eq(false)
    end
  end
  it 'ensure password presence' do
    user = User.new(username: 'username', email: 'email@gmail.com', password_confirmation: 'password').save
    expect(user).to eq(false)
  end
  it 'ensure password_confirmation presence' do
    user = User.new(username: 'username', email: 'email@gmail.com', password: 'password').save
    expect(user).to eq(false)
  end
  describe 'associations' do
    it { should have_many(:events).without_validating_presence }

    it { should have_many(:invitations).with_foreign_key('attendee_id').without_validating_presence }
  end
end