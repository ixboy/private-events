module EventsHelper
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

  def new_invitation_button(due)
    if due
      ''
    else
      link_to 'Add New Invitation', new_invitation_url, class: 'text-white btn btn-warning'
    end
  end

  def display_errors
    render 'event_errors' if @event.errors.any?
  end
end
