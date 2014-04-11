# Vision

## Background

People are generally bad at both coming up with, and remembering good
passwords. Every time a list of passwords somehow gets leaked passwords like
`password` and `12345` are among the most commonly used.

**Using passwords brings no value in itself - the only thing we want is to be
able to get in to our own stuff, and keep other people out.** I firmly believe
that passwords are a bad way of accomplishing this.

## Other solutions

**OAuth** is definitely a step in the right direction, but it has some
anti-features:

-    You rely on a systems you don't control for authentication, if they go
     down your users can't log in.
-    You often have to implement multiple OAuth providers to make sure everyone
     can use your service, and in the worst case let them fall back to using passwords.

**Password Managers** are great, but I believe that they are fixing a problem
that we should not have to begin with.

**Using the same password everywhere:** I won't even discuss this one.

### Using email as authentication

This is the approach this project takes.

A couple of articles ([original][1] and a [follow up][2]) has been written
about this, and a [proof of concept][3] was made - but since then I
haven't heard much about it. I really like this approach because it frees you
from both dealing with third parties and remembering lots of passwords. It
is also very simple and straight forward both for developers and users.

I want to see this solution used in some real projects.

[1]: http://notes.xoxco.com/post/27999787765/is-it-time-for-password-less-login  "Original article"
[2]: http://notes.xoxco.com/post/28288684632/more-on-password-less-login         "Follow up article"
[3]: https://nomorepasswordsjustemail.meteor.com/                                "Proof of concept"

### Feature goals

- Easy installation in Rails apps as a Gem
- Ability to generate and send emails with login-links to users
- Send an optional temporary security code that can be manually entered to log in
- Expire log-in links after a given amount of time
