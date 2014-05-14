# Getting started

[example app]: https://github.com/alcesleo/keymail-example

This guide will take you through installing and configuring Keymail in your
Rails application. To see a more realistic example, you can look at the [example app][]

## Installation

To install keymail, put this in your `Gemfile`:

```ruby
gem 'keymail'
```

Then run this to install it

```bash
# install the gem
bundle

# install the gems migrations
rake keymail:install:migrations
rake db:migrate
```

### Setting up mail

Your application obviously needs to be able to send emails, if you have not
already configured this, the fastest way to get started is to use a GMail
account, just create a `config/initializers/setup_mail.rb` file with contents
like this:

```ruby
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "your_username",
  :password             => "your_password"
  :authentication       => "plain",
  :enable_starttls_auto => true
}
ActionMailer::Base.default_url_options[:host] = 'localhost:3000'
```

_You should **not** commit your passwords to a public Github repo, use
something like [Figaro](https://github.com/laserlemon/figaro) to keep it out of
source control (the [example app][] does this)._

TODO: Setting the "from" email address in initializer

### Using it in your controller

To actually use Keymail you need to wire it up to a controller, at this time this
is completely manual but this might change in the future. You need to set up
a couple of routes:

```ruby
# config/routes.rb
Rails.application.routes.draw do

  root 'auth#new'
  post 'request_email', to: 'sessions#request_authentication_email'

  # specifying `as: 'keymail_link_target'` here is very important, it is used
  # internally to generate the authentication link
  get  'auth/:url_key', to: 'sessions#validate_authentication_link', as: 'keymail_link_target'

end
```

You also need to explicitly state the host in the environment configurations:

```
# config/environments/development.rb
Rails.application.routes.default_url_options[:host] = 'localhost:3000'

# config/environments/production.rb
Rails.application.routes.default_url_options[:host] = 'http://keymail-example.herokuapp.com'
```

Failing to set these will lead to **"Missing host to link to"** errors.


Keymail provides you with a service class: `Keymail::Authentication` that you
can use in your controllers to do everything that keymail does, here is a basic
use case (without error handling!):

```ruby
class SessionsController < ApplicationController

  def request_authentication_email
    Keymail::Authentication.request(params[:email])
  end

  def validate_authentication_link
    result = Keymail::Authentication.verify_url_key(params[:url_key])
    if result.authenticated?
      redirect_to :success
    else
      redirect_to :fail
    end
  end

end
```
