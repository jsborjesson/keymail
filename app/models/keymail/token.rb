module Keymail
  class Token < ActiveRecord::Base
    before_create :generate_token

    validates_presence_of :email
    validates_presence_of :expires_at

    def expired?
      expires_at.past?
    end

    def url
      Rails.application.routes.url_helpers.keymail_link_target_url(url_key)
    end

    def generate_token
      begin
        self.url_key = SecureRandom.urlsafe_base64
      end while Token.exists?(url_key: url_key)
    end
  end
end
