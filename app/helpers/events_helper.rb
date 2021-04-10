module EventsHelper
  def list_past_events(events)
    if events.empty?
      'No past events.'
    else
      content_tag :ul, class: 'd-flex flex-column' do
        events.map { |event| concat link_to event[0], event_path(event[1]) }
      end
    end
  end

  def list_upcoming_events(events)
    if events.empty?
      'No upcoming events'
    else
      content_tag :ul, class: 'd-flex flex-column' do
        events.map { |event| concat link_to event[0], event_path(event[1]) }
      end
    end
  end

  def new_invitation_button(due)
    if due
      ''
    else
      link_to 'Add New Invitation', new_invitation_url, class: 'text-white btn btn-primary'
    end
  end

  def display_errors
    render 'event_errors' if @event.errors.any?
  end
end
