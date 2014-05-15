# Advanced

## `Keymail::Authentication`

This is the service class that you will be using for pretty much everything,
its interface is defined as follows:


### `Keymail::Authentication.request(email)`

**Sends an authentication email to an email.**

It creates a token in the database with authentication data and
sends an email to the specified address.

Returns the `Keymail::Token` used on success.

Raises `ArgumentError` if email is `nil`.

Raises any exceptions caused by `ActionMailer`.
Note: you might need to enable them in your `config/environments/` settings
by adding/changing this line:

```ruby
config.action_mailer.raise_delivery_errors = true
```

### `Keymail::Authentication.validate_url_key(url_key)`

**Checks if an authentication link is valid.**

The `url_key` is only the authentication string part of the URL.

It destroys the token so it cannot be used again, no matter what happens.

Returns an object with the following methods:

- `authenticated?`
- `email` _(unless token was invalid)_
- `expired?` _(unless token was invalid)_

Note that if the token has already been used, it is deleted and therefore considered invalid.
