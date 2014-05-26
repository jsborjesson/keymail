require 'test_helper'

module Keymail
  describe Authentication do
    context '.request' do

      let(:email) { 'test@email.com' }

      it 'creates a new token' do
        -> { Authentication.request(email) }.must_change 'Token.count', +1
      end

      it 'returns the token on success' do
        Authentication.request(email).must_be_kind_of Token
      end

      it 'sends an email' do
        -> { Authentication.request(email) }.must_change 'ActionMailer::Base.deliveries.count', +1
      end

      it 'raises an error if email is nil' do
        -> { Authentication.request(nil) }.must_raise ArgumentError
      end

      it 'sets the expiration time to the configured one' do
        Keymail.config.expiration_time = 1.minute
        Authentication.request(email).expires_at.must_be_close_to 1.minute.since, 0.1
      end
    end

    context '.verify_url' do
      it 'destroys the token' do
        token = Factory :token
        Authentication.verify_url_key(token.url_key)
        Token.exists?(token).must_equal false
      end

      it 'does not delete anything if the token is invalid' do
        -> { Authentication.verify_url_key('not_a_valid_key') }.wont_change 'Token.count'
      end

      context 'authenticated' do
        let(:token) { Factory :token }
        let(:response) { Authentication.verify_url_key(token.url_key) }

        it 'is authenticated' do
          response.must_be :authenticated?
        end

        it 'has an email' do
          response.email.must_equal token.email
        end

        it 'is not expired' do
          response.wont_be :expired?
        end

        # first time, redirect...
      end

      context 'expired' do
        let(:token) { Factory :token, expires_at: 10.minutes.ago }
        let(:response) { Authentication.verify_url_key(token.url_key) }

        it 'is not authenticated' do
          response.wont_be :authenticated?
        end

        it 'has an email' do
          response.email.must_equal token.email
        end

        it 'is expired' do
          response.must_be :expired?
        end
      end

      context 'invalid' do
        let(:response) { Authentication.verify_url_key('invalid_url_key') }

        it 'is not authenticated' do
          response.wont_be :authenticated?
        end
      end

    end
  end
end
