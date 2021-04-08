module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.username, class: 'gravatar')
  end

  def my_attendance(current_user_attendance)
    if current_user_attendance.any?
      content_tag :ul, class: 'd-flex flex-column' do
        current_user_attendance.map { |event| concat link_to event.event_name, event_path(event.id) }
      end
    else
      'have no events to attend yet'
    end
  end
  def past_events(past_attendance)
    if past_attendance.any?
      content_tag :ul, class: 'd-flex flex-column' do
        past_attendance.map { |event| concat link_to event.event_name, event_path(event.id) }
      end
    else
      'have not attended any event in the past'
    end
  end

  def invitees(attendees)
    if attendees.empty?
      'No invited members'
    else
      content_tag :ul, class: 'd-flex flex-column' do
        attendees.map { |attendee| concat link_to attendee.username, user_path(attendee.id) }
      end
    end
  end
end
