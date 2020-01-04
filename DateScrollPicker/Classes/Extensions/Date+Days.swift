//
//  Date+Days.swift
//  DateScrollPicker
//
//  Created by Alberto Aznar de los Ríos on 13/11/2019.
//  Copyright © 2019 Alberto Aznar de los Ríos. All rights reserved.
//

import Foundation

extension Date {
    
    static func today() -> Date {
        let cal = NSCalendar.current
        let components = cal.dateComponents([.year, .month, .day], from: Date())
        let today = cal.date(from: components)
        return today!
    }
    
    func plain() -> Date {
        let cal = NSCalendar.current
        let components = cal.dateComponents([.year, .month, .day], from: self)
        let plain = cal.date(from: components)
        return plain!
    }
    
    func firstDateOfMonth() -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)
        return calendar.date(from: components)!
    }
    
    func addDays(_ days: Int) -> Date? {
        let dayComponenet = NSDateComponents()
        dayComponenet.day = days
        let theCalendar = NSCalendar.current
        let nextDate = theCalendar.date(byAdding: dayComponenet as DateComponents, to: self)
        return nextDate
    }
    
    func addMonth(_ month: Int) -> Date? {
        let dayComponenet = NSDateComponents()
        dayComponenet.month = month
        let theCalendar = NSCalendar.current
        let nextDate = theCalendar.date(byAdding: dayComponenet as DateComponents, to: self)
        return nextDate
    }
    
    func isWeekend() -> Bool {
        return Calendar.current.isDateInWeekend(self)
    }
}
