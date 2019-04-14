<p align="center">
  <img src="https://raw.githubusercontent.com/dingwilson/RandomUserSwift/master/Assets/banner.png" width="780" title="RandomUserSwift">
</p>

[![Build Status](https://travis-ci.org/dingwilson/RandomUserSwift.svg?branch=master)](https://travis-ci.org/dingwilson/RandomUserSwift)
[![codecov](https://codecov.io/gh/dingwilson/RandomUserSwift/branch/master/graph/badge.svg)](https://codecov.io/gh/dingwilson/RandomUserSwift)
[![doccov](https://wilsonding.com/RandomUserSwift/badge.svg)](https://wilsonding.com/RandomUserSwift)
[![CocoaPods Version Status](https://img.shields.io/cocoapods/v/RandomUserSwift.svg)](https://cocoapods.org/pods/RandomUserSwift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-Compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
![Platform](https://img.shields.io/badge/platforms-iOS-333333.svg)
[![Swift](https://img.shields.io/badge/Swift-5.0+-orange.svg)](https://swift.org)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

<p align="center">
  <img src="https://raw.githubusercontent.com/dingwilson/RandomUserSwift/master/Assets/screenshot.gif" width="369" title="Screenshot">
</p>

RandomUserSwift is an easy to use Swift framework that provides the ability to generate random users and their accompanying data for your Swift applications. It utilizes [randomuser.me](https://www.randomuser.me) API to generate the data.

1. [Integration](#integration)
    - [Cocoapods](#cocoapods)
    - [Carthage](#carthage)
2. [Usage](#usage)
3. [License](#license)

## Integration

#### CocoaPods
You can use [CocoaPods](https://cocoapods.org/) to install `RandomUserSwift` by adding it to your `Podfile`:
```ruby
target 'MyApp' do
	pod 'RandomUserSwift'
end
```

#### Carthage
You can use [Carthage](https://github.com/Carthage/Carthage) to install `RandomUserSwift` by adding it to your `Cartfile`:
```
github "dingwilson/RandomUserSwift"
```

## Usage

Import the framework

```swift
import RandomUserSwift
```

Then, use the `getUsers` function via the `shared` singleton with a completion handler.

```swift
RandomUser.shared.getUsers { data, error in
    guard let data = data else { return }

    print(data)
}
```

For more information on the configuration and returned values, check out the [RandomUserSwift documentation](https://wilsonding.com/RandomUserSwift) or [RandomUser official documentation](https://www.randomuser.me/documentation)


## License

`RandomUserSwift` is released under an [MIT License](https://opensource.org/licenses/MIT). See `LICENSE` for details.

**Copyright &copy; 2016-present Wilson Ding.**

*Please provide attribution, it is greatly appreciated.*
