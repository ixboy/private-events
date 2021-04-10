require 'rails_helper'

RSpec.describe 'Events', type: :request do
  current_user = User.first_or_create!(username: 'username', email: 'email@example.com', password: 'password',
                                       password_confirmation: 'password')

  let(:valid_attributes) do
    {
      event_name: 'Festa',
      venue: 'City',
      event_date: '2021-04-02',
      description: 'festa super grande',
      user_id: current_user.id
    }
  end

  let(:invalid_attributes) do
    {
      id: 'a',
      event_name: 'Festa',
      venue: 'City',
      event_date: '2021-04-02',
      description: 'festa super grande'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      event = Event.new(valid_attributes)
      event.creator = current_user
      event.save
      get events_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      event = Event.new(valid_attributes)
      event.creator = current_user
      event.save
      get event_url(event)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_event_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      event = Event.new(valid_attributes)
      event.creator = current_user
      event.save
      get edit_event_url(event)
      expect(response).to be_successful
    end
  end
end
