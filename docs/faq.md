## Not yet FAQ:s

### Why not just use passwords?

Your users are probably terrible at both coming up with and remembering good passwords,
this saves them the effort and you won't have to implement "reset password" functionality
(which is basically what this does every time).

### Why not just use OAuth?

OAuth makes you dependent on third parties, usually multiple since you probably need to implement
more than one provider to cover all of your client base (not everyone has Twitter / Facebook), and
in worst case you still have a fall back on using passwords if you really need to cover everyone.

### But this requires my clients to have an email!

I think it's safe to assume that anyone using any kind of webservice will have an email address.

### Email is also a third party!

True, but in this case the user can choose herself, or even run her own
if she is very paranoid about security, and unlike OAuth you only have to implement
**one** adapter to take care of all of these "third parties".

### Why not hack Devise to do this?

That is probably a great way to go, please do! Devise is big and I wanted to build something lighter from scratch.

### But this means I can't collect lots of user data when registering!

Yep, your users will probably be very pleased by the absence of a long registration form,
if you need more data about a user I would recommend redirecting them to a
profile settings page after the first login.

### Why not to use Keymail

OAuth has a couple of strong advantages over this approach, the main one being that you can gather
information about a user without her interference, Keymail is practically equivalent to passwords
in this case because you will need to ask the user to enter any more info you need.

If you want this functionality, you should use OAuth instead, but in a lot of
cases when OAuth is used, it either doesn't use this extra info, or
require more permissions than it actually needs (which looks suspicious to
users).

### It is a hassle to log in to my email every time!

I think most people are constantly logged in to their email these days, and get email instantly.
Even if they don't you just need to do this once per device, if you own it you don't need
to log out.

### I still need a password for my email!

Yes that's true, I recommend using 2 (or 3) step authentication for this to be really secure.
This is not a silver bullet, but I think that **reducing** the number of passwords you need
is a good thing.

### But if someone gets access to the email address they can log in!

True, but this is already a threat to most sites due to the password reset functionality.
