<p align="center">
   <img width="300" src="https://raw.githubusercontent.com/alberdev/DateScrollPicker/master/Images/header_DateScrollPicker.png" alt="DateScrollPicker  Logo">
</p>

# DateScrollPicker

[![Version](https://img.shields.io/cocoapods/v/DateScrollPicker.svg?style=flat&colorB=008B60)](https://cocoapods.org/pods/DateScrollPicker)
[![License](https://img.shields.io/cocoapods/l/DateScrollPicker.svg?style=flat)](https://cocoapods.org/pods/DateScrollPicker)
[![Platform](https://img.shields.io/cocoapods/p/DateScrollPicker.svg?style=flat)](https://cocoapods.org/pods/DateScrollPicker)
![Swift](https://img.shields.io/badge/%20in-swift%205.0-orange.svg?style=flat&colorB=008B60)

## Table of Contents

- [Description](#description)
- [Example](#example)
- [Installation](#installation)
- [Usage](#usage)
  - [UIView in your xib / storyboard](#uiviewinyourxib/storyboard)
  - [Format](#format)
  - [DataSource](#datasource)
  - [Delegates](#delegates)
  - [Extra](#extra)
- [Apps using DateScrollPicker](#apps-using-datescrollpicker)
- [Author](#author)
- [Contributing](#contributing)
- [License](#license)

## Description

You can use `DateScrollPicker` as a calendar with scroll date views. This collection has infinite date cells with animated selection. You can customize all this cells with your own fonts and colors with `DateScrollPickerFormat`. Take a look to next params and learn how to use ;)

- [x] Awesome infinite date picker
- [x] Totally customizable
- [x] Animation selection
- [x] Show custom data for each date
- [x] Easy usage
- [x] Supports iOS, written in Swift 5

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

<p align="center" >
<img src="https://raw.githubusercontent.com/alberdev/DateScrollPicker/master/Images/video.gif" alt="DateScrollPicker" title="DateScrollPicker demo">
</p>

## Installation

DateScrollPicker is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile and run `pod install`:

```ruby
pod 'DateScrollPicker'
```

Then you can import it when you need

```swift
import DateScrollPicker
```

## Usage

In the example you will see some datescrollpicker views with different formats that can be used in your project. Once you've installed the pod, follow next steps. It's really simple:

### UIView in your xib / storyboard

Add a `UIView` in the xib where you want to place DateScrollPicker view. Then you have to input the class name in the view, you can change this in the identity inspector of the interface builder. Remember to input `DateScrollPicker` in both (Class & Module)

<img src="https://github.com/alberdev/DateScrollPicker/blob/master/Images/screenshot_1.png?raw=true" alt="Screenshot 1" style="margin: auto" />

Then, connect the IBOutlet in your UIViewController

```swift
@IBOutlet weak var dateScrollPicker: DateScrollPicker!
```

### Format

You can format `DateScrollPicker` with your own parameters. Use it in all fields to get the same style. See default values:
 
```swift
var format = DateScrollPickerFormat()

/// Number of days
format.days = 5

/// Top label date format
format.topDateFormat = "EEE"

/// Top label font
format.topFont = UIFont.systemFont(ofSize: 10, weight: .regular)

/// Top label text color
format.topTextColor = UIColor.black

/// Top label selected text color
format.topTextSelectedColor = UIColor.white

/// Medium label date format
format.mediumDateFormat = "dd"

/// Medium label font
format.mediumFont = UIFont.systemFont(ofSize: 30, weight: .bold)

/// Medium label text color
format.mediumTextColor = UIColor.black

/// Medium label selected text color
format.mediumTextSelectedColor = UIColor.white

/// Bottom label date format
format.bottomDateFormat = "MMM"

/// Bottom label font
format.bottomFont = UIFont.systemFont(ofSize: 10, weight: .regular)

/// Bottom label text color
format.bottomTextColor = UIColor.black

/// Bottom label selected text color
format.bottomTextSelectedColor = UIColor.white

/// Day radius
format.dayRadius: CGFloat = 5

/// Day background color
format.dayBackgroundColor = UIColor.lightGray

/// Day background selected color
format.dayBackgroundSelectedColor = UIColor.darkGray

/// Selection animation
format.animatedSelection = true

/// Separator enabled
format.separatorEnabled = true

/// Separator top label date format
format.separatorTopDateFormat = "MMM"

/// Separator top label font
format.separatorTopFont = UIFont.systemFont(ofSize: 20, weight: .bold)

/// Separator top label text color
format.separatorTopTextColor = UIColor.black

/// Separator bottom label date format
format.separatorBottomDateFormat = "yyyy"

/// Separator bottom label font
format.separatorBottomFont = UIFont.systemFont(ofSize: 20, weight: .regular)

/// Separator bottom label text color
format.separatorBottomTextColor = UIColor.black

/// Separator background color
format.separatorBackgroundColor = UIColor.lightGray.withAlphaComponent(0.2)

/// Fade enabled
format.fadeEnabled = false

/// Animation scale factor
format.animationScaleFactor: CGFloat = 1.1

/// Animation scale factor
format.dayPadding: CGFloat = 5

/// Top margin data label
format.topMarginData: CGFloat = 10

/// Dot view size
format.dotWidth: CGFloat = 10
```

Is important to finally assign format to `DateScrollPicker`

```swift
dateScrollPicker.format = format
```

### Implement datasource and delegate

The first way to customize this `DateScrollPicker` is implementing delegate and datasource methods. These methods handle the most common use cases. Both of them are optional. 

```swift
dateScrollPicker.dataSource = self
dateScrollPicker.delegate = self
```

### DataSource

Is used to provide data for date views. The data source must adopt the `DateScrollPickerDataSource` protocol

```swift
// Returns custom attributed string for top label
func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, topAttributedStringByDate date: Date) -> NSAttributedString?

// Returns custom attributed string for medium label
func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, mediumAttributedStringByDate date: Date) -> NSAttributedString?

// Returns custom attributed string for bottom label
func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, bottomAttributedStringByDate date: Date) -> NSAttributedString?

// Returns custom attributed string for separator top label
func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, separatorTopAttributedStringByDate date: Date) -> NSAttributedString?

// Returns custom attributed string for separator bottom label
func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, separatorBottomAttributedStringByDate date: Date) -> NSAttributedString?

// Returns custom attributed string for data label
func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, dataAttributedStringByDate date: Date) -> NSAttributedString?

// Returns custom color for dot view
func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, dotColorByDate date: Date) -> UIColor?
```

### Delegates

In order to add more functionality in your app, you must implement `DateScrollPickerDelegate `. Is the responsible for managing selection behavior.

```swift
// Called when date is selected
func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, didSelectDate date: Date)
```

### Extra

You can also use next methods for scrolling to current date or other.

```swift
// Scroll to current date
func selectToday(animated: Bool?)

// Scroll to date
func scrollToDate(date: Date, animated: Bool?)
```

## Apps using DateScrollPicker

If you use `DateScrollPicker` I'd love to hear about it and feature your app here!

<img src="Images/Apps/drinkgo.png" width="50" height="50" valign="middle"> [DrinkGo](https://itunes.apple.com/app/drink-go/id1479579998)

## Author

Alberto Aznar, info@alberdev.com

## Contributing

Feel free to collaborate with ideas 💭, issues ⁉️ and/or pull requests 🔃.

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

DateScrollPicker is available under the MIT license. See the LICENSE file for more info.
