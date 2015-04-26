module Utilities

  def self.new_session_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(session_token)
    Digest::SHA1.hexdigest(session_token.to_s)
  end

  def self.new_session_digest
    self.encrypt(self.new_session_token)
  end

end
