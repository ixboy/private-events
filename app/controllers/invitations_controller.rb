class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.find(params[:id])
    attendee = User.find_by(email: params[:email])
    @invitation = @event.invitations.build(attendee_id: attendee.id)

    respond_to do |format|
      if @invitation.save
        format.html do
          redirect_to @event, notice: "#{attendee.username} has successfully been invited"
        end
      end
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :id)
  end
end
