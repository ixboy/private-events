class Invitation < ApplicationRecord
  validates :attendee_id, presence: true
  validates_presence_of :event_id
  belongs_to :attendees, foreign_key: 'attendee_id', class_name: 'User'
  belongs_to :event, foreign_key: 'event_id', class_name: 'Event'

  def self.list_attendees(event)
    where(event_id: event.id)
      .pluck(:invitee_id)
  end

  def self.name_attendees(list)
    User.where({ id: list })
      .pluck(:username)
  end

  def self.list_past_invitations(user)
    Event.past_events.where({ id: where(invitee_id: user.id) })
      .pluck(:event_name, :id)
  end

  def self.list_upcoming_invitations(user)
    Event.upcoming_events.where({ id: where(attendee_id: user.id) })
      .pluck(:event_name, :id)
  end
end
