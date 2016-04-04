//
//  LTSwiftDate.swift
//  LTSwiftDate
//
//  Created by ltebean on 16/4/4.
//  Copyright © 2016年 ltebean. All rights reserved.
//

import Foundation

public extension NSDate {
    
    public func toString(format format: String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }
    
    public func daysSinceDate(date: NSDate) -> Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day], fromDate: date.startOfDay(), toDate: self.startOfDay(), options: [])
        return components.day
    }
    
    public func daysBeforeDate(date: NSDate) -> Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day], fromDate: self.startOfDay(), toDate: date.startOfDay(), options: [])
        return components.day
    }
    
    public func startOfDay() -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        return calendar.startOfDayForDate(self)
    }
    
    public func endOfDay() -> NSDate {
        return startOfDay() + (60 * 60 * 24 - 1).seconds
    }
    
    public func isEqualToDate(date: NSDate, ignoreTime: Bool) -> Bool {
        if !ignoreTime {
            return self.isEqualToDate(date)
        }
        return self.startOfDay().isEqualToDate(date.startOfDay())
    }
    
    public func isToday() -> Bool {
        return isEqualToDate(NSDate(), ignoreTime: true)
    }
    
    public func toDateString() -> String {
        return toString(format: "MMM d, yyyy")
    }
}


public extension String {
    
    public func toDate(format format: String) -> NSDate? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.dateFromString(self)
    }
}


public extension Int {
    
    public var seconds: NSDateComponents {
        let dateComponents = NSDateComponents()
        dateComponents.second = self
        return dateComponents
    }
    
    public var minutes: NSDateComponents {
        let dateComponents = NSDateComponents()
        dateComponents.minute = self
        return dateComponents
    }
    
    public var hours: NSDateComponents {
        let dateComponents = NSDateComponents()
        dateComponents.hour = self
        return dateComponents
    }
    
    public var days: NSDateComponents {
        let dateComponents = NSDateComponents()
        dateComponents.day = self
        return dateComponents
    }
    
    public var weeks: NSDateComponents {
        let dateComponents = NSDateComponents()
        dateComponents.day = 7 * self
        return dateComponents
    }
    
    public var months: NSDateComponents {
        let dateComponents = NSDateComponents()
        dateComponents.month = self
        return dateComponents
    }
    
    public var years: NSDateComponents {
        let dateComponents = NSDateComponents()
        dateComponents.year = self
        return dateComponents
    }
}

public func > (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedDescending
}

public func < (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs === rhs || lhs.compare(rhs) == .OrderedSame
}

public func + (lhs: NSDate, rhs: NSDateComponents) -> NSDate {
    let calendar = NSCalendar.currentCalendar()
    return calendar.dateByAddingComponents(rhs, toDate: lhs, options: [])!
}

public func - (lhs: NSDate, rhs: NSDateComponents) -> NSDate {
    return lhs + (-rhs)
}

public prefix func - (dateComponents: NSDateComponents) -> NSDateComponents {
    let result = NSDateComponents()
    let units: [NSCalendarUnit] = [.Day, .Month, .Year, .Hour, .Minute, .Second, .Nanosecond, .YearForWeekOfYear, .WeekOfYear, .Weekday, .Quarter, .WeekdayOrdinal, .WeekOfMonth]
    for unit in units {
        let value = dateComponents.valueForComponent(unit)
        if value != Int(NSDateComponentUndefined) {
            result.setValue(-value, forComponent: unit)
        }
    }
    return result
}

