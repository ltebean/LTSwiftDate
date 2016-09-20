![LTSwiftDate](https://cocoapod-badges.herokuapp.com/v/LTSwiftDate/badge.png)
## Installation
```
pod 'LTSwiftDate'
```

## How to use

#### NSDate & String conversion

NSDate to String
```swift
let time = Date().toString(format: "MM/dd/yyyy") //  04/08/2016
let time = Date().toString(format: "MMM d, H:mm a") //  Apr 8, 8:29 AM
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


Example:
```swift
let now = Date()
let nextMinute = now + 1.minutes
let yesterday = now - 1.days
let lastMonth = now - 1.months
...
```

#### Date comparison
You can compare dates using:
* `>`
* `>=`
* `==`
* `<`
* `<=`
* isEqualToDate

Example:
```swift
let now = Date()
let tomorror = now + 1.days
if (now < tomorrow) {
  ...
}

now.isEqual(toDate: now + 1.mins, ignoreTime=true) // true
```

#### Date shortcut
```swift
let now = Date()
let startOfDay = now.startOfDay()
let endOfDay = now.endOfDay()

```

#### Date caculation
```swift
let now = Date()
let tomorrow = now + 1.days
let days = now.daysBeforeDate(tomorrow) // days will be 1
```
