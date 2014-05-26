# Developing

## Testing

Testing is done with [Minitest](https://github.com/seattlerb/minitest/) using
the spec syntax. It's supposed to be as minimal and readable as possible.

### Running the tests

To run all the tests:

    rake test

They are also run on [Travis CI](https://travis-ci.org/alcesleo/keymail/builds), you can see test statistics for all builds there.

### Code coverage

Is generated automatically into the `coverage/` folder every time the tests are run, there is a rake task to open them quickly:

    rake dev:coverage

They are also run on [Coveralls](https://coveralls.io/r/alcesleo/keymail?branch=master), you can see code coverage statistics for all builds there.

## Documentation

I'm generating this documentation using [MkDocs](https://github.com/tomchristie/mkdocs).

```bash
# make sure the tools are installed
pip install mkdocs ghp-import

# serve the documentation site at localhost:8000
mkdocs serve

# generate docs in the site/ directory
mkdocs build

# publish to github pages
ghp-import -p site
```

There is also a rake task to quickly build and deploy the docs (the last two commands):

    rake dev:publish_docs

Make sure you keep the `mkdocs.yml` in sync and you should be all set.

## Releases

Versioning follows [SemVer](http://semver.org/), except prereleases are
indicated with a dot, because of RubyGems (e.g `v0.1.0.pre`).

### Checklist

- Make sure the tests pass
- Make sure the documentation is updated and deployed
- Make a commit with these contents unless it's done already:
    - Document the high level changes in `CHANGELOG.md` _(you can see the relevant commits like this `git log --oneline v0.1.0..HEAD`)_
    - Bump the version in `lib/keymail/version.rb`
    - `bundle` will set the new version in `Gemfile.lock`
- Merge it into `master`
- `rake release`
- If needed, update [keymail-example](https://github.com/alcesleo/keymail-example) to reflect the changes, then make a tag with the same version as the release.
