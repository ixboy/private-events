module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-primary'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def navbar_username
    link_to Current.user.username, edit_password_path, class: 'nav-link' if Current.user
  end

  def navbar_logout
    button_to 'Logout', logout_path, method: :delete, class: 'btn btn-outline-secondary' if Current.user
  end

  def navbar_link_logout
    link_to 'Logout', logout_path, method: :delete, class: 'nav-link' if Current.user
  end

  def navbar_sign_up
    link_to 'Sign Up', sign_up_path, class: 'nav-link' unless Current.user
  end

  def navbar_login
    link_to 'Login', sign_in_path, class: 'nav-link' unless Current.user
  end

  def navbar_new_event
    link_to 'New Event', new_event_path, class: 'nav-link' if Current.user
  end

  def navbar_my_event
    link_to 'My Events', events_path, class: 'nav-link' if Current.user
  end

  def navbar_home
    if Current.user
      link_to 'Private Events', events_all_url, class: 'navbar-brand'
    else
      link_to 'Private Events', root_url, class: 'navbar-brand'
    end
  end
end
