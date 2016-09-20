//
//  LTSwiftDate.swift
//  LTSwiftDate
//
//  Created by ltebean on 16/4/4.
//  Copyright © 2016年 ltebean. All rights reserved.
//

import Foundation

public extension Date {
    
    public func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    public func daysSinceDate(_ date: Date) -> Int {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.day], from: date.startOfDay(), to: self.startOfDay(), options: [])
        return components.day!
    }
    
    public func daysBeforeDate(_ date: Date) -> Int {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.day], from: self.startOfDay(), to: date.startOfDay(), options: [])
        return components.day!
    }
    
    public func startOfDay() -> Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: self)
    }
    
    public func endOfDay() -> Date {
        return startOfDay() + (60 * 60 * 24 - 1).seconds
    }
    
    public func isEqual(toDate date: Date, ignoreTime: Bool) -> Bool {
        if !ignoreTime {
            return (self == date)
        }
        return (self.startOfDay() == date.startOfDay())
    }
    
    public func isToday() -> Bool {
        return isEqual(toDate: Date(), ignoreTime: true)
    }
    
    public static func == (lhs: Date, rhs: Date) -> Bool {
        return lhs.compare(rhs) == .orderedSame
    }
    
    public static func > (lhs: Date, rhs: Date) -> Bool {
        return lhs.compare(rhs) == .orderedDescending
    }
    
    public static func < (lhs: Date, rhs: Date) -> Bool {
        return lhs.compare(rhs) == .orderedAscending
    }
    
}


public extension String {
    
    public func toDate(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
}


public extension Int {
    
    public var seconds: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.second = self
        return dateComponents
    }
    
    public var minutes: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.minute = self
        return dateComponents
    }
    
    public var hours: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.hour = self
        return dateComponents
    }
    
    public var days: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.day = self
        return dateComponents
    }
    
    public var weeks: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.day = 7 * self
        return dateComponents
    }
    
    public var months: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.month = self
        return dateComponents
    }
    
    public var years: DateComponents {
        var dateComponents = DateComponents()
        dateComponents.year = self
        return dateComponents
    }
}







public func + (lhs: Date, rhs: DateComponents) -> Date {
    let calendar = Calendar.current
    return (calendar as NSCalendar).date(byAdding: rhs, to: lhs, options: [])!
}

public func - (lhs: Date, rhs: DateComponents) -> Date {
    return lhs + (-rhs)
}

public prefix func - (dateComponents: DateComponents) -> DateComponents {
    var result = DateComponents()
    let units: [Calendar.Component] = [.day, .month, .year, .hour, .minute, .second, .nanosecond, .yearForWeekOfYear, .weekOfYear, .weekday, .quarter, .weekdayOrdinal, .weekOfMonth]
    for unit in units {
        let value = dateComponents.value(for: unit)!
        if value != Int(NSDateComponentUndefined) {
            result.setValue(-value, for: unit)
        }
    }
    return result
}

