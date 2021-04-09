
require 'rails_helper'

RSpec.describe Event, type: :model do
  current_user = User.first_or_create!(username:'username', email: 'email@example.com', password: 'password', password_confirmation: 'password')

  it 'has an event' do
    event = Event.new( 
        event_name: 'Festa', 
        venue: 'City', 
        event_date: '2021-04-02', 
        description: 'festa', 
        user_id: current_user.id
    )
    
        expect(event).to be_valid
        event.event_name = ''
        expect(event).to_not be_valid
    end

      it 'has no venue and no description' do
    event = Event.new( 
        event_name: 'Festa', 
        venue: '', 
        event_date: '2021-04-02', 
        description: 'festa', 
        user_id: current_user.id
    )
    
        expect(event).to_not be_valid
        event.description = ''
        expect(event).to_not be_valid
    end
    
  it 'has description ' do
    hundred_char_string = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m'

    event = Event.new( 
        event_name: 'Festa', 
        venue: 'luanda', 
        event_date: '2021-04-02', 
        description: '', 
        user_id: current_user.id
    )
    
    event.description = hundred_char_string
    expect(event).to be_valid

  end

  describe 'associations' do
    it { should belong_to(:creator).without_validating_presence }
    it { should have_many(:invitations).without_validating_presence }
    it { should have_many(:attendees).without_validating_presence }
  end
end