module ApplicationHelper

  BOARD = 'rnbqkbnrpppppppp--------------------------------PPPPPPPPRNBQKBNR'

  FULL_CASTLING_RTS   = 'KQkq'
  UNSET_PASSANT_POS   = '-'
  UNSET_PROMOTION_POS = '-'
  WHITE               = 'w'

  def alert
    flash
  end

  def app_state
    { alert: alert, debug: debug, logged_in: logged_in?, main: main }
  end

  def chess
    {
      :orientation => WHITE,
      :color => WHITE,
      :context => {
        :board => BOARD,
        :player => WHITE,
        :castlingRights => FULL_CASTLING_RTS,
        :passantPosition => UNSET_PASSANT_POS,
        :promotionPosition => UNSET_PROMOTION_POS,
        :clock => 0,
        :moveNumber => 1
      }
    }
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

  def home
    {
      chess: chess,
      notifications: [],
      playing: false,
      user_display: user_display
    }
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

  def user_display
    { pagination: pagination, user_list: user_list }
  end

  def user_list
    {
      current_user: filter_user_attributes(current_user),
      users: filter_user_attributes(@users)
    }
  end

  def view
    params[:action]
  end

end
