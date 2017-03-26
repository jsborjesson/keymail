require "test_helper"

module Keymail
  describe Token do
    it "generates a url_key when created" do
      token = Factory.create :token
      token.url_key.wont_be_nil
    end

    it "must have an email" do
      token = Factory.build :token, email: ""
      token.must_have_invalid :email
    end

    it "must have an expiration date" do
      token = Factory.build :token, expires_at: nil
      token.must_have_invalid :expires_at
    end

    it "is expired after its expiry date" do
      token = Factory.build :token, expires_at: 1.second.ago
      token.must_be :expired?
    end
  end
end
