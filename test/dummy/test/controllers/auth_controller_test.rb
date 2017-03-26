require "test_helper"

describe AuthController do
  let(:test_email) { "test@email.com" }

  it "renders the form" do
    get :new
    assert_template :new
  end

  it "redirects to form if no email is posted" do
    post :request_email
    assert_redirected_to :root
  end

  it "sends an email to the right address" do
    post :request_email, email: test_email

    ActionMailer::Base.deliveries.wont_be :empty?
    ActionMailer::Base.deliveries.last.to.must_equal [test_email]

    assert_template :request_email
  end

  it "redirects to success page with valid token" do
    get :validate_link, url_key: valid_token.url_key

    assert_redirected_to :success
  end

  it "redirects to error page with invalid token" do
    get :validate_link, url_key: "invalid_url_key"
    assert_redirected_to :fail
  end

  it "redirects to error page with expired token" do
    get :validate_link, url_key: expired_token.url_key
    assert_redirected_to :fail
  end

  def expired_token
    Factory :token, expires_at: 1.second.ago
  end

  def valid_token
    Factory :token
  end
end
