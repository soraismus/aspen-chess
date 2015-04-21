module ApplicationHelper
  def app_state
    { debug: debug }
  end

  def debug
    {
      should_debug: Rails.env.development?,
      debug_params: debug_content(params)
    }
  end

  def debug_content(object)
    Marshal::dump(object)
    object = ERB::Util.html_escape(object.to_yaml)
                      .gsub("  ", "&nbsp; ")
                      .html_safe
  end

  def server_config
    { id: 'react-node', prerender: true }
  end
end
