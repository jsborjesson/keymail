# Developing

## Testing

Testing is done with [Minitest](https://github.com/seattlerb/minitest/) using the spec syntax and
[Minifacture](https://github.com/stephencelis/minifacture) for factories. It's supposed to be as
minimal and readable as possible. You can see a full history of tests [here](https://travis-ci.org/alcesleo/keymail/builds).

### Running the tests

To run all the tests:

    rake test

They are also run on [Travis CI](https://travis-ci.org/alcesleo/keymail/builds)

### Code coverage

Is generated automatically every time the tests are run, to open the statistics run:

    rake coverage

You can read the statistics on [Coveralls](https://coveralls.io/r/alcesleo/keymail?branch=master)

## Documentation

I'm generating this documentation using [MkDocs](https://github.com/tomchristie/mkdocs).

```bash
pip install mkdocs ghp-import

# serve the documentation site at localhost:4567
mkdocs serve

# generate docs in the site/ directory
mkdocs build

# publish to github pages
ghp-import -p site
```

Make sure you keep the `mkdocs.yml` in sync and you should be all set.

## Releases

Versioning follows [SemVer](http://semver.org/), except prereleases are
indicated with a dot, because of RubyGems (e.g `v0.1.0.pre`).

### Checklist

- Make sure the tests pass
- Make sure the documentation is correct
- Make a commit with these contents unless it's done already:
    - Document the high level changes in `CHANGELOG.md`
    - Bump the version in `lib/keymail/version.rb`
    - `bundle` will set the new version in `Gemfile.lock`
- `rake release`
- If needed, update keymail-example to reflect the changes, then make a tag with the same version as the release
