require 'test_helper'

module Keymail
  describe AuthMailer do

    let(:token) { Factory :token }
    let(:email) { ActionMailer::Base.deliveries.last }
    let(:body) { email.body.raw_source }

    before do
      # Reset the list of sent email
      ActionMailer::Base.deliveries.clear
      AuthMailer.log_in(token).deliver
    end


    it 'sends the email' do
      ActionMailer::Base.deliveries.wont_be :empty?
    end

    it 'sends authentication email to the right address' do
      email.to.must_equal [token.email]
    end

    it 'has the log in link' do
      # TODO: link_to
      body.must_have_content "http://localhost:3000/auth/#{token.url_key}"
    end

    it 'has the expiration date' do
      body.must_have_content "valid until #{token.expires_at}"
    end

    it 'sends from the configured from_email' do
      # set in config/initializers/keymail_setup.rb
      email.from.must_equal ['rails.keymail@gmail.com'] # FIXME: set this here
    end

  end
end
