module Keymail
  class AuthMailer < ActionMailer::Base
    default from: Keymail.config.from_email

    def log_in(token)
      @token = token

      mail to: token.email
    end
  end
end
