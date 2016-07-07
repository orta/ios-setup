# iOS Setup Script

A bash script for setting up a user's environment to see if tests are passing in XCode.

## Installation

`bash <(curl -s https://raw.githubusercontent.com/flatiron-school/ios-setup/master/install.sh)`

## What It Does

1. The `install.sh` file sets up a storage location for the user's Github Username which we use to assign progress on labs.
2. The `test_runner.sh` file is included with each lab and run after executing the test suite.
3. The `batch_test_runner_updater.rb` script is used to update labs which use an old version of `test_runner.sh`
