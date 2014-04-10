# Keymail

**UNDER CONSTRUCTION** - the contents of this file are written ahead of their implementation.

**Keymail is a simple password-replacement gem for Rails apps.**

Instead of using passwords to log in your users, it takes only an **email**
and sends a message like this:

> #### This email was sent to you by [KeymailExample](http://keymail-example.herokuapp.com)
>
> To log in, simply click this link:
>
>    &nbsp;&nbsp;&nbsp;&nbsp;<http://keymail-example.herokuapp.com/auth/A8D6mZOY2O8hDla2o8T2JQ>
>
> If you want to log in on a different device than you received this email on, use this security code instead:
>
>    &nbsp;&nbsp;&nbsp;&nbsp;**7203931**
>
> _(This is useful for example if you want to log in to a friends computer and receive emails on your phone)_
>
> The codes above are valid until _2014-04-10 18:35_

This frees you both from the trouble of managing passwords, and the risk of delegating to a third party (like OAuth).

Inspired by [this article](http://notes.xoxco.com/post/27999787765/is-it-time-for-password-less-login).

## Example

There is a [running example](http://keymail-example.herokuapp.com/) with [source code](https://github.com/alcesleo/keymail-example) available to look at.

## Documentation

[Documentation can be found here](http://alcesleo.github.io/keymail/).

## Configuration

TODO

- length of passcodes
- turn off passcodes (just ignore it in templates?)
- set length of expiration time
- redirect on login 
- `first_login?` to redirect to registration forms

## Installation

See the [documentation] for more information

- setup emailing

## Security

- Cookie stealing, always use https
- open source secret_token.rb

## Releases

Follow [SemVer](http://semver.org/)

## Not yet FAQ:s

### Why not just use passwords?

Your users are probably terrible at both coming up with and remembering good passwords,
this saves them the effort and you won't have to implement "reset password" functionality
(which is basically what this does every time).

### Why not just use OAuth?

OAuth makes you dependent on third parties, usually multiple since you probably need to implement
more than one provider to cover all of your client base (not everyone has Twitter / Facebook), and
in worst case you still have a fall back on using passwords if you really need to cover everyone.

require too much permissions

### Why not use Keymail

OAuth has a couple of strong advantages over this approach, the main one being that you can gather
information about a user without her interference, Keymail is practically equivalent to passwords
in this case because you will need to ask the user to enter any more info you need.

In a lot of cases when OAuth is used, it either doesn't use this extra info, or require
more permissions than it actually needs (which looks suspicious to users).

### It is a hassle to log in to my email every time!

I think most people are constantly logged in to their email these days, and get email instantly.
Even if they don't you just need to do this once per device, if you own it you don't need
to log out.

### But this requires my clients to have an email!

I think it's safe to assume that anyone using any kind of webservice will have an email address.


### I still need a password for my email!

Yes that's true, I recommend using 2 (or 3) step verification for this to be really secure.
This is not a silver bullet, but I think that **reducing** the number of passwords you need
is a good thing.

### But if someone gets access to the email address they can log in!

True, but this is already a threat to most sites due to the reset-password functionality.

### Email is also a third party!

True, but in this case the user can choose herself, or even run her own
if she is very paranoid about security, and unlike OAuth you only have to implement
**one** adapter to take care of all of these "third parties".

### But this means I can't collect lots of user data when registering!

Yep, your users will probably be very pleased by the absence of a long registration form,
if you need more data about a user I would recommend redirecting them to a
profile settings page after the first login.
