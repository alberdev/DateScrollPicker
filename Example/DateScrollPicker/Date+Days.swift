//
//  Date+Days.swift
//  DateScrollPicker_Example
//
//  Created by Alberto Aznar de los Ríos on 21/11/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

extension Date {
    
    static func today() -> Date {
        let cal = NSCalendar.current
        let components = cal.dateComponents([.year, .month, .day], from: Date())
        let today = cal.date(from: components)
        return today!
    }
    
    func addDays(_ days: Int) -> Date? {
        let dayComponenet = NSDateComponents()
        dayComponenet.day = days
        let theCalendar = NSCalendar.current
        let nextDate = theCalendar.date(byAdding: dayComponenet as DateComponents, to: self)
        return nextDate
    }
}
