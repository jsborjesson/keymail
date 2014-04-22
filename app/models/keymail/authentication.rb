module Keymail
  module Authentication
    def self.request(email)
      # TODO: initializers for expires_at
      token = Token.create(email: email, expires_at: 10.minutes.since)
      AuthMailer.log_in(token).deliver
    end

    def self.verify_url_key(url_key)
      token = Token.find_by(url_key: url_key)
      token.destroy! unless token.nil?

      return Failure.new if token.nil?
      return Expired.new(token) if token.expired?

      Success.new(token)
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
