module Keymail
  class AuthMailer < ActionMailer::Base
    default from: "rails.keymail@gmail.com"

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.auth_mailer.log_in.subject
    #
    def log_in(token)
      @token = token

      mail to: token.email
    end
  end
end
