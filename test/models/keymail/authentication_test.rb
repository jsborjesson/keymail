require 'test_helper'

module Keymail
  describe Authentication do
    context '.request' do

      it 'creates a new token' do
        -> { Authentication.request('test@email.com') }.must_change 'Token.count', +1
      end

      it 'sends an email' do
        -> { Authentication.request('test@email.com') }.must_change 'ActionMailer::Base.deliveries.count', +1
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
