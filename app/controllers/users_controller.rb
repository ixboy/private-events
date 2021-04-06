class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])

    my_events = Event.where(creator: Current.user.id)
    @current_user_event = my_events || [{ title: 'No Personal Events at the Moment' }]

    my_attendance = Invitation.where(attendee_id: Current.user.id).pluck(:event_id)
    @current_user_attendance = Event.where(id: my_attendance)
  end
end
