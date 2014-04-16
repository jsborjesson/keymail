# Testing

Testing is done with [Minitest](https://github.com/seattlerb/minitest/) using the spec syntax and
[Minifacture](https://github.com/stephencelis/minifacture) for factories. It's supposed to be as
minimal and readable as possible. You can see a full history of tests [here](https://travis-ci.org/alcesleo/keymail/builds).

## Running the tests

To run all the tests:

    rake test

There is also a task to open the coverage reports:

    rake coverage
