module Keymail
  module Auth
    def self.request(email)
      token = Token.create(email: 'whatever', expires_at: 10.minutes.since)
      AuthMailer.log_in(token).deliver
    end
  end
end
