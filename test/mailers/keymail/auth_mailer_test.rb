require 'test_helper'

module Keymail
  describe AuthMailer do

    before do
      # Reset the list of sent email
      ActionMailer::Base.deliveries.clear
      AuthMailer.log_in(token).deliver
    end

    let(:token) { Factory :token }
    let(:email) { ActionMailer::Base.deliveries.last }
    let(:body) { email.body.raw_source }

    it 'sends the email' do
      ActionMailer::Base.deliveries.wont_be :empty?
    end

    it 'sends authentication email to the right address' do
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
