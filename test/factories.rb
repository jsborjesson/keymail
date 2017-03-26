# Using Minifacture
# https://github.com/stephencelis/minifacture

Factory.define :token, class: Keymail::Token do |f|
  f.email "user%d@example.com"
  f.expires_at 10.minutes.since
end
