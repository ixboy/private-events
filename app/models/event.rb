class Event < ApplicationRecord
  # validates :event_name, presence: true, length: { minimum: 3, maximum: 50 }
  # validates :description, presence: true
  # validates :venue, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :invitations
  has_many :attendees, through: :invitations, foreign_key: 'Event_id'

  #   scope :past_events, -> { where('event_date < ?', DateTime.now) }
  #   scope :upcoming_events, -> { where('event_date > ?', DateTime.now) }

  #   def self.find_upcoming_events
  #     upcoming_events.order('created_at DESC').pluck(:title, :id)
  #   end

  #   def self.find_past_events
  #     past_events.order('created_at DESC').pluck(:title, :id)
  #   end
end
