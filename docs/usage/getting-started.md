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

