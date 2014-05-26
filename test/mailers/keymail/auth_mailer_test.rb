require 'test_helper'

module Keymail
  describe AuthMailer do

    let(:token)      { Factory :token }
    let(:emails)     { ActionMailer::Base.deliveries }
    let(:email)      { emails.last }
    let(:body)       { email.body.raw_source }
    let(:from_email) { 'test@email.com' }

    before do
      emails.clear
      Keymail.config.from_email = from_email

      AuthMailer.log_in(token).deliver
    end

    it 'sends the email' do
      emails.wont_be :empty?
    end

    it 'sends authentication email to the right address' do
      email.to.must_equal [token.email]
    end

    it 'has the log in link' do
      body.must_have_content "http://localhost:3000/auth/#{token.url_key}"
    end

    it 'has the expiration date' do
      body.must_have_content "valid until #{token.expires_at}"
    end

    it 'sends from the configured from_email' do
      email.from.must_equal [from_email]
    end

  end
end
