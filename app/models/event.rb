class Event < ApplicationRecord
  validates :event_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true
  validates :venue, presence: true
  validates :event_date, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :invitations
  has_many :attendees, through: :invitations

  scope :past_events, -> { where('event_date < ?', DateTime.now).pluck(:event_name, :id) }
  scope :upcoming_events, -> { where('event_date > ?', DateTime.now).pluck(:event_name, :id) }
end
