module Keymail
  module Authentication
    def self.request(email)
      raise ArgumentError, 'Email cannot be nil' if email.nil?

      token = Token.create!(email: email, expires_at: Keymail.config.expiration_time.since)
      AuthMailer.log_in(token).deliver

      token
    end

    def self.verify_url_key(url_key)
      token = find_and_destroy_token(url_key)

      return Failure.new if token.nil?
      return Expired.new(token) if token.expired?

      Success.new(token)
    end

    private
    def self.find_and_destroy_token(url_key)
      token = Token.find_by(url_key: url_key)

      # this does not destroy the reference, only the database entry
      token.destroy! unless token.nil?
    end
  end

  class TokenResponse
    def initialize(token)
      @token = token
    end
    delegate :email, :expired?, to: :@token
  end

  class Success < TokenResponse
    def authenticated?
      true
    end
  end

  class Expired < TokenResponse
    def authenticated?
      false
    end
  end

  class Failure
    def authenticated?
      false
    end
  end
end
