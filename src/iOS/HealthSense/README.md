# Health Sense

[![Build Status](https://travis-ci.com/SensehacK/capstone-team4.svg?branch=master)](https://travis-ci.com/SensehacK/capstone-team4)

## Description

Smart mobile devices are one of the best gifts of technology! The most important characteristics of our era may be the transformation, transmission and dominion of information. We live in an information society where the leading role has been given to new technologies, especially those devoted to information. Undoubtedly, smart phones have made significant contribution in human life and progress. This advancement is to make life easy and to increase human comfort at home and at work. With a rapid increase in the health industry being challenging on human’s well-being this application grants an opportunity to its members to get instant access to important health plan information. It also minimizes the need to install multiple health app to track health information thus, providing the members to get all the information in one app at a glance. A cross platform application which works on both Android and iOS platform for the users to get all required notifications of their daily routine and workout therefore making it viable.

## Build

### iOS Build

Clone the code and use Xcode v10+ to build the codebase.
Currently we haven’t added any packages to the build yet, if we do add those, you may need to do a quick

> pod install

For installing all of the package dependency handled by CocoaPods or Swift Package manager.
Open _.xcworkspace_ after package dependency has been installed.
Change the project with specific bundle identifier and run it on the simulator.
Alternatively you can run it on your phone given you have Apple Developer account.

## Develop

### iOS

Install Swift Linter for proper code suggestions and we would also incorporate Unit tests as a way to be more compliant with Test driven development, even though this project isn’t designed and developed around TDD principles.

## Workflow

Please go through the Pinned workflows in [Issues section](https://github.com/SensehacK/capstone-team4/issues?q=is%3Aissue+label%3A%C2%AF%5C_%5B%E3%83%84%5D_%2F%C2%AF)

## Test

### iOS Test

We are incorporating Unit tests as our default workflow.
The tests could be found in test branch and tests folder.

## CI/CD

We are utilizing Travis CI for checking our test cases while there is a pull request or master branch code commits.
[Travis CI iOS Doc](https://docs.travis-ci.com/user/languages/objective-c/#objective-c-vs-swift)
We are also trying to incorporate Github Actions but there are some hiccups with setting up our Cocoapods and linking with our Xcode build commands. If you could help us the PR is this [Actions](https://github.com/SensehacK/capstone-team4/actions?query=workflow%3ASwift)
[PR](https://github.com/SensehacK/capstone-team4/pull/19)

## Build Issues

This section would discuss about building issues only for iOS project.
I'm keeping track of any specific build errors with Xcode on this cheat sheet repo.
[Dev CheatSheet](https://github.com/SensehacK/dev-cheatsheet/tree/master/iOS_documentation)

- Pods couldn't find
The file “Pods-.xcconfig” couldn’t be opened because there is no such file.
cd to HealthSense $PWD

> pod install

So that cocoapods will reinstall properly & open using .xcworkspace
