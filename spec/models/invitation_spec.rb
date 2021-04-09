require 'rails_helper'

RSpec.describe Invitation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

end


RSpec.describe Invitation, type: :model do
  current_user = User.first_or_create!(username:'username', email: 'email@example.com', password: 'password', password_confirmation: 'password')
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

  # it 'returns a list of previously attended events of a user' do
  #   @invitee = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
  #   @birthday = Event.create(title: 'Birthday', location: 'Foo City', date: '2020-04-02',
  #                            time: '2000-01-01 14:22:00.000000000 +0000',
  #                            description: 'Birthday', creator_id: @invitee.id)
  #   @invitation = Invitation.create(invitee_id: @invitee.id, event_id: @birthday.id)
  #   past_events = Invitation.list_past_invitations(@invitee)
  #   expect(past_events.last[0]).to eq('Birthday')
  # end

  # it 'returns a list of upcoming events of a user' do
  #   @invitee = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
  #   @birthday = Event.create(title: 'Birthday', location: 'Foo City', date: '2022-04-02',
  #                            time: '2000-01-01 14:22:00.000000000 +0000',
  #                            description: 'Birthday', creator_id: @invitee.id)
  #   @invitation = Invitation.create(invitee_id: @invitee.id, event_id: @birthday.id)
  #   upcoming_events = Invitation.list_upcoming_invitations(@invitee)
  #   expect(upcoming_events.last[0]).to eq('Birthday')
  # end
end