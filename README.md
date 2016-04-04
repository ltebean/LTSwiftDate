![LTSwiftDate](https://cocoapod-badges.herokuapp.com/v/LTSwiftDate/badge.png)

#### String & NSDate conversion

NSDate to String
```swift
NSDate().toString(format: "yyyy/MM/dd")
```

#### String to NSDate
```swift
"2016/04/03".toDate(format: "yyyy/MM/dd")
```

#### NSDate operation
```swift
let now = NSDate()
let nextMinute = now + 1.minutes
let yesterday = now - 1.days
let lastMonth = now - 1.months
...
```

#### NSDate comparison
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
