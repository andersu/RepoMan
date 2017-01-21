//
//  Date+ISO8601.swift
//  Nabohjelp
//
//  Created by Anders Ullnæss on 28/09/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

extension Date {
    struct Formatter {
        static let iso8601: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZ"
            return formatter
        }()
        
        static let timeSentTodayFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "nb_NO")
            formatter.timeZone = TimeZone.current
            formatter.dateFormat = "'I dag' HH:mm"
            return formatter
        }()
        
        static let timeSentFullFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "nb_NO")
            formatter.timeZone = TimeZone.current
            formatter.dateFormat = "d. MMM 'kl.' HH:mm"
            return formatter
        }()
        
        static let dayMonthFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "nb_NO")
            formatter.timeZone = TimeZone.current
            formatter.dateFormat = "d. MMM"
            return formatter
        }()
        
        static let dayMonthYearFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "nb_NO")
            formatter.timeZone = TimeZone.current
            formatter.dateFormat = "MMM d, yyyy"
            return formatter
        }()
        
        static let minuteHourFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "nb_NO")
            formatter.timeZone = TimeZone.current
            formatter.dateFormat = "HH:mm"
            return formatter
        }()
    }
    
    var iso8601: String {
        return Formatter.iso8601.string(from: self)
    }
    
    var timeSentTodayFormat: String {
        return Formatter.timeSentTodayFormat.string(from: self)
    }
    
    var timeSentFullFormat: String {
        return Formatter.timeSentFullFormat.string(from: self)
    }
    
    var dayMonthFormat: String {
        return Formatter.dayMonthFormat.string(from: self)
    }
    
    var dayMonthYearFormat: String {
        return Formatter.dayMonthYearFormat.string(from: self)
    }
    
    var minuteHourFormat: String {
        return Formatter.minuteHourFormat.string(from: self)
    }
}

extension String {
    var dateFromISO8601: Date? {
        return Date.Formatter.iso8601.date(from: self)
    }
    
    var dateFromTimeSentFullFormat: Date? {
        return Date.Formatter.timeSentFullFormat.date(from: self)
    }
}
