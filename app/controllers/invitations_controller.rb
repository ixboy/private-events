class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.find(params[:id])
    if !Current.user.nil? && Current.user.id == @event.user_id
      attendee = User.find_by(email: params[:email])
      invalid_email(attendee)
      return if attendee.nil?
      @invitation = @event.invitations.build(attendee_id: attendee.id)
      redirect_to @event, notice: "#{attendee.username} has successfully been invited" if @invitation.save
    else
      flash[:error] = 'You must be signed in to invite members' 
      flash[:error] = 'You can only invite members to your own events' if !Current.user.nil?
      render :new
    end
  end


  private
  def invalid_email(attendee)
    if attendee.nil?
      flash[:error] = 'You can only invite valid members'
      redirect_to event_path
    end 
  end

  def invitation_params
    params.require(:invitation).permit(:email, :id)
  end
end