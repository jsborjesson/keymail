require 'test_helper'

module Keymail
  describe Auth do
    context '.request' do

      it 'creates a new token' do
        -> { Auth.request('test@email.com') }.must_change 'Token.count', +1
      end

      it 'sends an email' do
        -> { Auth.request('test@email.com') }.must_change 'sent_emails.count', +1
      end
    end
  end
end
