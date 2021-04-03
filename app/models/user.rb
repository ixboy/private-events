class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, length: { minimum: 2, maximum: 50 }
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }, uniqueness: true
    validates :password, length: { minimum: 4 }, presence: true
    validates :password_confirmation, length: { minimum: 4 }, presence: true

    has_many :events, class_name: 'Event', foreign_key: 'creator_id' # (direct ownership)
    has_many :events, foreign_key: :user_id 
      
  # This is telling that the user has many invitations (direct ownership)
    has_many :invitations, foreign_key: :attendee
  # This is telling that the user can attend events and these events can be found through the Invitation table
    has_many :event_id, through: 'invitations'
end
