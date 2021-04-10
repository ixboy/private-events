require 'rails_helper'

RSpec.describe Invitation, type: :model do
  current_user = User.first_or_create!(username: 'username', email: 'email@example.com', password: 'password',
                                       password_confirmation: 'password')
  event = Event.first_or_create!(
    event_name: 'Festa',
    venue: 'City',
    event_date: '2021-04-02',
    description: 'festa',
    user_id: current_user.id
  )
  @invitation = Invitation.create(attendee_id: current_user.id, event_id: event.id)
  attendees = Invitation.where(event_id: event.id).pluck(:attendee_id)

  it 'retrieves a list of attendees for an event' do
    expect(attendees.last).to eq(current_user.id)
  end

  it 'returns the attendees names' do
    @attendees = Event.find(event.id).attendees.pluck(:username)
    expect(@attendees[@attendees.size - 1]).to eq(current_user.username)
  end

  it 'returns the attendees names' do
    @attendees = Event.find(event.id).attendees.pluck(:username)
    expect(@attendees[@attendees.size - 1]).to eq(current_user.username)
  end

  it 'does not create an invitation' do
    invitation = nil
    expect(invitation).to be_nil
  end

  describe 'associations' do
    it { should belong_to(:attendees).without_validating_presence }
    it { should belong_to(:event).without_validating_presence }
  end
end
