module ApplicationHelper
  def alert
    flash
  end

  def app_state
    { alert: alert, debug: debug, main: main }
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

  def home
    nil
  end

  def main
    { home: home }
  end

  def server_config
    { id: 'react-node', prerender: true }
  end
end
