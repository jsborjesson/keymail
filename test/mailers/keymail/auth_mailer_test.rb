require 'test_helper'

require 'minitest/mock'

module Keymail
  describe AuthMailer do
    it 'sends log in email' do
      token = Factory.build :token

      email = AuthMailer.log_in(token).deliver
      ActionMailer::Base.deliveries.wont_be :empty?
      email.to.must_equal [token.email]
    end
  end
end
