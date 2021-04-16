class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true,
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }, uniqueness: true
  validates :password, length: { minimum: 4 }, presence: true
  validates :password_confirmation, length: { minimum: 4 }, presence: true

  has_many :events, dependent: :destroy
  has_many :invitations, foreign_key: 'attendee_id', dependent: :destroy
  has_many :attended_events, through: :invitations
end
