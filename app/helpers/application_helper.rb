module ApplicationHelper
  def sidebar_link_item(name, path)
    class_name = 'channel'
    class_name << ' active' if current_page?(path)

    content_tag :li, class:class_name do
      link_to name, path, class: 'channel_name'
    end
  end
  
  def should_sidebar?
    request.env['PATH_INFO'] != root_path &&
    request.env['PATH_INFO'] != new_user_session_path &&
    request.env['PATH_INFO'] != user_session_path &&
    request.env['PATH_INFO'] != new_user_registration_path
  end
end
