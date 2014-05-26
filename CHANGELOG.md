# Releases

## v0.3.0

- Expiration time of keymails is now configurable
- Configuration no longer interfering with global config namespace

## v0.2.2

- Support configuration with an initializer file
- Much more complete documentation

## v0.2.1

- No longer hardcoding `localhost:3000` as the base url for authentication links
- `Authentication.request` raises `ArgumentError` instead of `StandardError` when missing email

## v0.2.0

- `Authentication.request` now returns the token it cretes
- Some integration testing, dummy app is functional
- Login links work only once

## v0.1.0

Most basic functionality seems to be in place.

## v0.1.0.alpha

Testing release to document the release process and test integration.

