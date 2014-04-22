# Keymail

[![Build Status](https://travis-ci.org/alcesleo/keymail.svg?branch=master)](https://travis-ci.org/alcesleo/keymail)
[![Coverage Status](https://coveralls.io/repos/alcesleo/keymail/badge.png?branch=master)](https://coveralls.io/r/alcesleo/keymail?branch=master)

**UNDER CONSTRUCTION** - the contents of this file are written ahead of their implementation.

**Keymail is an authentication via email-system, meant to be an alternative to passwords.**


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

## Links

**[Documentation][docs] | [Example app][example] ([source][example-source]) | [RubyGems][rubygems]**

_The example might take a long time to load the first time, it's on a free Heroku account._

[docs]:           http://alcesleo.github.io/keymail/
[example]:        http://keymail-example.herokuapp.com/
[example-source]: https://github.com/alcesleo/keymail-example
[rubygems]:       https://rubygems.org/gems/keymail

## Configuration

TODO

- Install the gem
- customize email message
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

