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
  context 'associations' do
  #   creator = User.first_or_create!(username: 'username', email: 'email@email.com', password: '123456789', password_confirmation: '123456789')
  #   @event = creator.events.build(event_name: 'Festa', venue: 'City', event_date: '2021-04-02', description: 'festay')

  #   it 'retrieves all the events created by a user' do
  #     events = User.find_by(creator)
  #     expect(events.all? { |event| event[0].is_a?(String) }).to be true
  #     expect(events.all? { |event| event[1].is_a?(Integer) }).to be true
  #   end

  #   it 'retrieves all invitations a user has' do
  #     @attendee = User.first_or_create!(username: 'name', email: 'email1@email.com', password: '123456789', password_confirmation: '123456789')
  #     @festa = Event.create(event_name: 'Festa', venue: 'City', event_date: '2021-04-02', description: 'festa', user_id: @attendee.id)
  #     @invitation = Invitation.create(attendee_id: @attendee.id, event_id: @festa.id)
  #     invitations = User.find_invitations_by_user(@attendee)
  #     expect(invitations.last).to equal(@festa.id)
  #   end
  end
end


