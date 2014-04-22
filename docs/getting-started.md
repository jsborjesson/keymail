# Getting started

## Installation

To install keymail, put this in your gemfile:

```ruby
gem 'keymail'
```

And make sure you mount it in your `config/routes.rb`:

```ruby
Rails.application.routes.draw do

  mount Keymail::Engine => "/keymail"
end
```

- run the migrations

### Mailing

TODO: configure "from"-email

Your app needs to be able to send emails, the fastest way is probably to use
a GMail account, then you just need to create an initializer file, for exaple
`config/initializers/setup_mail.rb` with contents like this:

```ruby
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "rails.keymail",
  :password             => "your_password"
  :authentication       => "plain",
  :enable_starttls_auto => true
}
ActionMailer::Base.default_url_options[:host] = 'localhost:3000'
```

NOTE: You should not commit your passwords to a public Github repo, use something
like [Figaro](https://github.com/laserlemon/figaro) to keep it out of source control.
