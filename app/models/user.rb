require 'utilities'

class User < ActiveRecord::Base

  VALID_USERNAME_REGEXP = /\A\w+\z/
  validates :name, :presence   => true,
                   :uniqueness => true,
                   :length     => { :maximum => 50 },
                   :format     => { :with => VALID_USERNAME_REGEXP }

  VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence   => true,
                    :format     => { :with => VALID_EMAIL_REGEXP },
                    :uniqueness => { :case_sensitive => true }

  before_create :create_session_digest

  has_secure_password
  validates :password, :length => { :minimum => 6 }

  #scope :except, ->(user) { where('id != ?', user) }

  def self.except(user)
    self.where("id != ?", user)
  end

  private

    def create_session_digest
      self.session_digest = Utilities.new_session_digest
    end

end
