module ApplicationHelper
  def alert
    flash
  end

  def app_state
    { alert: alert, debug: debug, header: header, main: main }
  end

  def chess
    nil
  end

  def csrf
    { token: form_authenticity_token, param: request_forgery_protection_token }
  end

  def debug
    {
      should_debug: Rails.env.development?,
      debug_params: debug_content(params)
    }
  end

  def debug_content(object)
    Marshal.dump(object)
    object = ERB::Util.html_escape(object.to_yaml)
                      .gsub("  ", "&nbsp; ")
                      .html_safe
  end

  # WET; c.f. `home`.
  def header
    { logged_in: logged_in? }
  end

  # WET; c.f. `header`.
  def home
    { user_home_view: user_home_view, logged_in: logged_in? }
  end

  def main
    { csrf: csrf, home: home, view: view }
  end

  def pagination
    nil
  end

  def server_config
    { id: 'react-node', prerender: true }
  end

  def logged_in?
    false
  end

  def user_display
    { pagination: pagination, user_list: user_list }
  end

  def user_home_view
    {
      chess: chess,
      notifications: [],
      playing: false,
      user_display: user_display
    }
  end

  def user_list
    nil
  end

  def view
    case params[:controller]
      when 'users'    then 'signup'
      when 'sessions' then 'login'
      else                  nil
    end
  end
end
