![LTSwiftDate](https://cocoapod-badges.herokuapp.com/v/LTSwiftDate/badge.png)
## Installation
```
pod 'LTSwiftDate'
```

## How to use

#### NSDate & String conversion

NSDate to String
```swift
let time = NSDate().toString(format: "MM/dd/yyyy") //  04/08/2016
let time = NSDate().toString(format: "MMM d, H:mm a") //  Apr 8, 8:29 AM
```

String to NSDate
```swift
"04/08/2016".toDate(format: "MM/dd/yyyy")
```

You can find the complete reference for the format string here: http://nsdateformatter.com/

#### NSDate operation
LTSwiftDate adds exension on `Int` to generate date components, it supports: 
* `seconds`
* `minutes`
* `hours`
* `days`
* `weeks`
* `years`


You can manipulate a date as:
```swift
let now = NSDate()
let nextMinute = now + 1.minutes
let yesterday = now - 1.days
let lastMonth = now - 1.months
...
```

#### NSDate comparison
You can compare dates using:
* `>`
* `>=`
* `==`
* `<`
* `<=`
* isEqualToDate

```swift
let now = NSDate()
let tomorror = now + 1.days
if (now < tomorrow) {
  ...
}

now.isEqualToDate(now + 1.mins, ignoreTime=true) // true
```

#### NSDate shortcut
```swift
let now = NSDate()
let startOfDay = now.startOfDay()
let endOfDay = now.endOfDay()

```

#### NSDate caculation
```swift
let now = NSDate()
let tomorrow = now + 1.days
let days = now.daysBeforeDate(tomorrow) // days will be 1
```
