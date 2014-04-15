class Token
  initialize(email)
  email
  url_key      # url safe token
  passcode     # 6-10 digit code for humans
  expires_at   # datetime
  expired?
  first_time?  # useful if sending different emails when registering
  expired      # scope
  redirect_url # alias next?
  destroy_expired!
  destroy_for_email!
end

module Authentication
  request(email, first_time=false, expiration_time=10.minutes) # creates a Token and calls AuthMailer
  verify_url(url_key) # returns Authenticated or Unauthenticated objects
  verify_passcode(passcode)# returns Authenticated or Unauthenticated objects
end

class Authenticated
  initialize(token)

  # delegates to token
  first_time?
  email
  redirect_url

  authenticated? # true
end

# null object for Authenticated
class Unauthenticated
  # throws UnauthenticatedException on all these
  first_time?
  email
  redirect_url

  authenticated? # false
end

class AuthMailer
  log_in(token)
end


# initializers/keymail.rb
default_expiration_time = 10.minutes

# Usage in controller
class AuthCtrl
  def email
    Keymail::Authentication.request(params[:email])
  end

  def log_in_link_clicked
    auth = Keymail::Authentication.verify_url(params[:token])
    if auth.authenticated?
      u = User.where(email: auth.email).first_or_create
      redirect_to auth.redirect_url || root_url
    else
      head :unauthorized
    end
  end
end

# More advanced example
class User
  auth_token # from railscast
end

class AuthCtrl
  def email
    first = User.exist?(email: params[:email])
    Keymail::Authentication.request(params[:email], first)
  end

  def log_in_link_clicked
    auth = Keymail::Authentication.verify_url(params[:token])
    authenticate(auth)
  end

  def passcode_entered
    auth = Keymail::Authentication.verify_passcode(params[:passcode])
    authenticate(auth)
  end

  private
  def authenticate(auth)
    if auth.authenticated?
      if auth.first_time?
        u = User.create(email: auth.email)
        log_in(u)
        redirect_to registration_url
      else
        u = User.find_by(email: auth.email)
        log_in(u)
        redirect_to auth.redirect_url || root_url
      end
    else
      head :unauthorized
    end
  end

  def log_in(user)
    cookies.permanent[:auth_token] = user.auth_token
  end
end
