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

    it 'contains "log in" text' do
      body.must_have_content 'log in'
    end

  end
end
