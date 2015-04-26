require 'utilities'

module SessionsHelper

  def current_user
    unless @current_user.nil?
      @current_user
    else
      session_token = cookies[:session_token]
      session_digest = Utilities.encrypt(session_token)
      self.current_user = User.find_by(session_digest: session_digest)
    end
  end

  def current_user=(user)
    @current_user = user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_in(user)
    reset_session_digest unless current_user.nil?

    session_token = Utilities.new_session_token
    session_digest = Utilities.encrypt(session_token)

    cookies.permanent[:session_token] = session_token
    user.update_attribute(:session_digest, session_digest)

    self.current_user = user
  end

  def log_out
    reset_session_digest
    cookies.delete(:session_token)
    self.current_user = nil
  end

  private
    def reset_session_digest
      new_session_digest = Utilities.new_session_digest
      current_user.update_attributes(session_digest: new_session_digest)
    end

end
