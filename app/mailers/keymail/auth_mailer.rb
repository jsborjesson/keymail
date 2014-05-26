module Keymail
  class AuthMailer < ActionMailer::Base
    def log_in(token)
      @token = token

      mail to: token.email,
           from: Keymail.config.from_email
    end
  end
end
