class AuthController < ApplicationController

  def new
  end

  def request_email
    if params[:email].nil?
      redirect_to :root
    else
      Keymail::Authentication.request(params[:email])
    end
  end

  def validate_link
    result = Keymail::Authentication.verify_url_key(params[:url_key])
    if result.authenticated?
      redirect_to :success
    else
      redirect_to :fail
    end

  end

#   def fail
#   end
#
#   def sucess
#   end


  # def validate_passcode
end
