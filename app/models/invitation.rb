class Invitation < ApplicationRecord
  validates :attendee_id, presence: true
  validates_presence_of :event_id
  belongs_to :attendees, foreign_key: 'attendee_id', class_name: 'User'
  belongs_to :event, foreign_key: 'event_id', class_name: 'Event'
end
