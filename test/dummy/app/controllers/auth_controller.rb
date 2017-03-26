class AuthController < ApplicationController
  def new; end

  def request_email
    if params[:email].nil?
      redirect_to :root
    else
      @email = params[:email]
      Keymail::Authentication.request(params[:email])
    end
  end

  def validate_link
    result = Keymail::Authentication.verify_url_key(params[:url_key])
    if result.authenticated?
      session[:success_email] = result.email
      redirect_to :success
    else
      redirect_to :fail
    end
  end

  def fail; end

  def success
    @email = session[:success_email]
  end

  # def validate_passcode
end
