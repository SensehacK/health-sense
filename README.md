<div align="center">
	<h1 align="center">Health Sense</h1>
	<p align="center">
		<a href="http://ant.design">
			<img width="200" src="https://raw.githubusercontent.com/SensehacK/health-sense/master/design/icons/export/healthSenseAppIcon.png">
		</a>
	</p>

[![Build Status][build-status-image]][build-status-url] [![Issues][issues-image]][issues-url] [![Closed PRs][close—pr-image]][close—pr-url] [![Code Coverage Status][codecov-image]][codecov-url]

[![iOS issues][ios-issues-image]][ios-issues-url] [![Help Wanted][help-wanted-image]][help-wanted-url] [![Open Issues][open-issues-image]][open-issues-url] [![Open PRs][open—pr-image]][open—pr-url]

[![Milestone][milestone1-image]][milestone1-url] [![Milestone][milestone2-image]][milestone2-url]

[![Github checks][github-checks-image]][github-checks-url]

</div>

[build-status-image]: https://travis-ci.com/SensehacK/health-sense.svg?branch=master
[build-status-url]: https://travis-ci.com/SensehacK/health-sense
[open-issues-image]: https://flat.badgen.net/github/open-issues/Sensehack/health-sense
[open-issues-url]: https://github.com/Sensehack/health-sense/issues?q=is%3Aopen+is%3Aissue
[issues-image]: https://flat.badgen.net/github/issues/Sensehack/health-sense
[issues-url]: https://github.com/SensehacK/health-sense/issues
[help-wanted-image]: https://flat.badgen.net/github/label-issues/Sensehack/health-sense/help-wanted/open
[help-wanted-url]: https://github.com/Sensehack/health-sense/issues?q=is%3Aopen+is%3Aissue+label%3A%22help+wanted%22
[open—pr-image]: https://flat.badgen.net/github/open-prs/SensehacK/health-sense
[open—pr-url]: https://github.com/SensehacK/health-sense/pulls?q=is%3Aopen+is%3Apr
[close—pr-image]: https://flat.badgen.net/github/merged-prs/SensehacK/health-sense
[close—pr-url]: https://github.com/SensehacK/health-sense/pulls?q=is%3Apr+is%3Aclosed
[milestone1-image]: https://flat.badgen.net/github/milestones/SensehacK/health-sense/2
[milestone1-url]: https://github.com/SensehacK/health-sense/milestone/2
[milestone2-image]: https://flat.badgen.net/github/milestones/SensehacK/health-sense/4
[milestone2-url]: https://github.com/SensehacK/health-sense/milestone/4
[codecov-image]: https://codecov.io/gh/SensehacK/health-sense/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/SensehacK/health-sense/
[github-checks-image]: https://flat.badgen.net/github/checks/SensehacK/health-sense/
[github-checks-url]: https://github.com/SensehacK/health-sense/pulse
[ios-issues-image]: https://flat.badgen.net/github/label-issues/SensehacK/health-sense/iOS/open
[ios-issues-url]: https://github.com/Sensehack/health-sense/issues?q=is%3Aopen+is%3Aissue+label%3AiOS

[![App Screenshot](https://drive.google.com/uc?export=view&id=17rr5bZdzeUEKF9NO-1diqd7VWA55TbwC)](https://drive.google.com/file/d/17rr5bZdzeUEKF9NO-1diqd7VWA55TbwC/view?usp=sharing)

## Description

Smart mobile devices are one of the best gifts of technology! The most important characteristics of our era may be the transformation, transmission and dominion of information. We live in an information society where the leading role has been given to new technologies, especially those devoted to information. Undoubtedly, smart phones have made significant contribution in human life and progress. This advancement is to make life easy and to increase human comfort at home and at work. With a rapid increase in the health industry being challenging on human’s well-being this application grants an opportunity to its members to get instant access to important health plan information. It also minimizes the need to install multiple health app to track health information thus, providing the members to get all the information in one app at a glance. A cross platform application which works on both Android and iOS platform for the users to get all required notifications of their daily routine and workout therefore making it viable.

## Design

### Sketch

Main app design using Sketch software to portray our basic idea of how the UI/Prototype would be. [Sketch cloud](https://sketch.cloud/s/4WR0Z/v/aMaGqp/)

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

### Best Practices

Every time you would work on your feature of the product always create a new branch with the feature name or ID and then raise a pull request to merge to "develop" branch.

### Code Merge

Master branch is protected so we would work on develop branch for daily work and only commit or merge to "Master" branch for deliverables or feature releases.
Merging to master branch would require one of us to approve the changes.
Pull request needs to be created for reviewing new changes to existing codebase.

## Test

### iOS Test

We are incorporating Unit tests as our default workflow.
The tests could be found in test branch and tests folder.

## CI/CD

We are utilizing Travis CI for checking our test cases while there is a pull request or master branch code commits.
[Travis CI iOS Doc](https://docs.travis-ci.com/user/languages/objective-c/#objective-c-vs-swift)
We are also trying to incorporate Github Actions but there are some hiccups with setting up our Cocoapods and linking with our Xcode build commands. If you could help us the PR is this [Actions](https://github.com/SensehacK/capstone-team4/actions?query=workflow%3ASwift)
[PR](https://github.com/SensehacK/capstone-team4/pull/19)

## Issues

We are using GitHub Issues, GitHub Projects to track our issues, feature requests for every user story.
Please file a Bug request or new Feature request [here](https://github.com/SensehacK/capstone-team4/issues)

## Timeline

Schedule for deliverables is mentioned in our Milestones. Our Product owner and project manager would prioritize which tasks takes precedence and would assign them to their specific Milestones accordingly.
You could find our milestones [here](https://github.com/SensehacK/capstone-team4/milestones)

## Environment

### OS

- Mac: Catalina 10.15
- Windows: Windows 10

### IDE

- Xcode 11.2.1
- VS Code

### Browsers

- Firefox Nightly /Dev /Main
- Safari /Technical Preview
- Microsoft Edge Dev (Chromium)

### Tools

- Version Control: Git
- Team management: Github Project, JIRA
- Group Communication: FaceTime, Zoom, WhatsApp Group
- GTD App: Things, Trello
- Documents: Microsoft Office Suite, Google Docs
- Shared Drive: Google Drive
- Terminal : iTerm
- Writer: iA Writer
- Terminal : iTerm
- Image: Adobe PhotoShop
- Icon Design: Adobe illustrator
- Prototype: Sketch

## Shared Links

## Credits

### Team

- [Abbas Shamshi](https://www.linkedin.com/in/abbas-shamshi/)(Front End Dev, Database Designer)
- [Endri Zylali](https://www.linkedin.com/in/endri-zylali/)(Android Dev, Back End Dev)
- [Kautilya Save](https://www.linkedin.com/in/kautilyasave/)(iOS Dev, Architect)
- [Manasi Tayade](https://www.linkedin.com/in/manasitayade5/)(Business Analyst, Designer)
- [Rushikesh Nage](https://www.linkedin.com/in/rushikesh-nage06/)(Project Manager, Scrum Master, Tester)
