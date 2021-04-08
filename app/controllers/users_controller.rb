class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])

    my_events = Current.user.events
    @current_user_event = my_events || [{ title: 'No Personal Events at the Moment' }]

    my_attendance = Invitation.where(attendee_id: Current.user.id).pluck(:event_id)
    @current_user_attendance = Event.where(id: my_attendance)
    @attended_events = Event.where(id: my_attendance).where('event_date < ?', DateTime.now)
  end
end
