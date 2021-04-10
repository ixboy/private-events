class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
    @current_user_event = @user.events || [{ title: 'No Personal Events at the Moment' }]
    user_attendance = Invitation.where(attendee_id: @user.id).pluck(:event_id)
    @future_events = Event.where(id: user_attendance)
    @attended_events = Event.where(id: user_attendance).where('event_date < ?', DateTime.now)
  end
end
