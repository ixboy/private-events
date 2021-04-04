module EventsHelper
    def event_errors_messages
      render 'display_event' if @event.errors.any?
    end

    def list_past_events(events)
      if events.empty?
        'There are no past events.'
      else
        content_tag :ul, class: 'd-flex flex-column' do
          events.map { |event| concat link_to event[0], event_path(event[1]) }
        end
      end
    end

    def list_upcoming_events(events)
      if events.empty?
        'There are no upcoming events'
      else
        content_tag :ul, class: 'd-flex flex-column' do
          events.map { |event| concat link_to event[0], event_path(event[1]) }
        end
      end
    end

    def show_invitees(invitees)
      if invitees.empty?
        'There are no invitees yet'
      else
        content_tag :ul, class: 'd-flex flex-column' do
          invitees.map { |invitee| concat(content_tag(:li, invitee)) }
        end
      end
    end

    def new_invitation_button(due)
      if due
        ''
      else
        link_to 'Add New Invitation', new_invitation_url, class: 'text-white btn btn-warning'
      end
    end
    def create_event_button
        link_to 'New Event', new_event_path,  class:"btn btn-primary" unless Current.user.nil?
    end
end
