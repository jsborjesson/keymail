require 'test_helper'

require 'minitest/mock'

module Keymail
  describe AuthMailer do

    let(:token) { Factory :token }
    let(:email) { AuthMailer.log_in(token).deliver }
    let(:body) { email.body.raw_source }

    it 'sends authentication email to the right address' do
      sent_emails.wont_be :empty?
      email.to.must_equal [token.email]
    end

    it 'has the log in link' do
      # TODO: link_to
      body.must_have_content "http://localhost:3000/keymail/auth/#{token.url_key}"
    end

    it 'has the expiration date' do
      body.must_have_content "valid until #{token.expires_at}"
    end
    # it 'has the optional passcode'

  end
end
