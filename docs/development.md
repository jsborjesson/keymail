# Developing

## Testing

Testing is done with [Minitest](https://github.com/seattlerb/minitest/) using the spec syntax and
[Minifacture](https://github.com/stephencelis/minifacture) for factories. It's supposed to be as
minimal and readable as possible. You can see a full history of tests [here](https://travis-ci.org/alcesleo/keymail/builds).

### Running the tests

To run all the tests:

    rake test

### Code coverage

Is generated automatically every time the tests are run, to open the statistics run:

    rake coverage

## Documentation

I'm generating this documentation using [MkDocs](https://github.com/tomchristie/mkdocs).

To work on the documentation locally you first need to install it:

    pip install mkdocs

Then you can serve the website locally using:

    mkdocs serve

Just keep the `mkdocs.yml` in sync and you should be all set.

## Releases

Versioning follows [SemVer](http://semver.org/), except prereleases are
indicated with a dot, because of RubyGems.(e.g `v0.1.0.pre`)

### Checklist

- Make sure the tests pass
- Make sure your working directory is clean
- Document the high level changes in `CHANGELOG.md`
- Bump the version in `lib/keymail/version.rb` and commit it
- `rake release`
