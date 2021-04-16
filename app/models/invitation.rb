class Invitation < ApplicationRecord
  validates :attendee_id, presence: true
  validates_presence_of :event_id
  belongs_to :attendees, class_name: 'User', foreign_key: 'attendee_id'
  belongs_to :attended_events, class_name: 'Event', foreign_key: 'event_id'
end
