module Keymail
  class Token < ActiveRecord::Base

    before_create :generate_token

    validates_presence_of :email
    validates_presence_of :expires_at

    def expired?
      expires_at.past?
    end

    def generate_token
      begin
        self.url_key = SecureRandom.urlsafe_base64
      end while Token.exists?(url_key: self.url_key)
    end
  end
end