# ReleaseRadar 📬

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/136d1e8dac924d2aa3152ebbdc65faf4)](https://app.codacy.com/app/magyarosibotond/ReleaseRadar?utm_source=github.com&utm_medium=referral&utm_content=halcyonmobile/ReleaseRadar&utm_campaign=Badge_Grade_Settings)
[![Build Status](https://travis-ci.org/halcyonmobile/ReleaseRadar.svg?branch=master)](https://travis-ci.org/halcyonmobile/ReleaseRadar)
[![codecov](https://codecov.io/gh/halcyonmobile/ReleaseRadar/branch/master/graph/badge.svg)](https://codecov.io/gh/halcyonmobile/ReleaseRadar)

Lightweight framework to check release notes after an iOS app update is performed.

- [About](#about)
- [Requirements](#requirements)
- [Features](#features)
- [Installation Instructions](#installation-instructions)
    - [Swift Package Manager](#swift-package-manager)
    - [CocoaPods](#cocoapods)
    - [Carthage](#carthage)
- [Usage](#usage)
- [License](#license)

## About

With iOS 7, *automatic app updates* were introduced making App Store release notes less relevant for the end user.

Other frameworks like [Siren](https://github.com/ArtSabintsev/Siren) check for available updates, **ReleaseRadar** checks for release notes after an update was performed.

Check out the documentation here: [Wiki](https://github.com/halcyonmobile/ReleaseRadar/wiki)

## Requirements

- iOS 9.0+ / macOS 10.11+
- XCode 9.0+
- Swift 4.1+

## Features

- [x] Check release notes on the Apple App Store
- [x] Swift Package Manager Support
- [x] CocoaPods Support
- [x] Carthage Support
- [ ] Unit tests

## Installation Instructions

### Swift Package Manager

```swift
.Package(url: "https://github.com/halcyonmobile/ReleaseRadar.git", majorVersion: 0, minorVersion: 2)
```

### CocoaPods

```ruby
pod 'ReleaseRadar'
```

### Carthage

```swift
github "halcyonmobile/ReleaseRadar"
```

## Usage

ReleaseRadar is easy to use through the exposed ReleaseRadar class.

```swift
let releaseRadar = ReleaseRadar(iTunesId: "12345678")
releaseRadar.verify(checkPolicy: .minor) { result in
    switch result {
    case .updated(let appInfo):
        // your app has been updated
        // access update information through *appInfo*
    case .notUpdated:
        // no update was performed
    }
}
```

## License

Apple is a trademark -, App Store is a service mark of Apple Inc., registered in the U.S. and other countries and regions.

ReleaseRadar is released under the MIT license. [See LICENSE](https://github.com/halcyonmobile/ReleaseRadar/blob/master/LICENSE) for details.

If you use the open-source library in your project, please make sure to credit and backlink to http://halcyonmobile.com
