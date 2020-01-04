//
//  DateScrollPicker+Protocols.swift
//  DateScrollPicker
//
//  Created by Alberto Aznar de los Ríos on 15/11/2019.
//  Copyright © 2019 Alberto Aznar de los Ríos. All rights reserved.
//

import UIKit

public protocol DateScrollPickerDataSource: class {
    
    /**
     ------------------------------------------------------------------------------------------
     Returns custom attributed string for top label
     ------------------------------------------------------------------------------------------
     - parameter dateScrollPicker: current dateScrollPicker
     - parameter date: cell date
     - returns: attributed string
     */
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, topAttributedStringByDate date: Date) -> NSAttributedString?
    
    /**
     ------------------------------------------------------------------------------------------
     Returns custom attributed string for medium label
     ------------------------------------------------------------------------------------------
     - parameter dateScrollPicker: current dateScrollPicker
     - parameter date: cell date
     - returns: attributed string
     */
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, mediumAttributedStringByDate date: Date) -> NSAttributedString?
    
    /**
     ------------------------------------------------------------------------------------------
     Returns custom attributed string for bottom label
     ------------------------------------------------------------------------------------------
     - parameter dateScrollPicker: current dateScrollPicker
     - parameter date: cell date
     - returns: attributed string
     */
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, bottomAttributedStringByDate date: Date) -> NSAttributedString?
    
    /**
     ------------------------------------------------------------------------------------------
     Returns custom attributed string for separator top label
     ------------------------------------------------------------------------------------------
     - parameter dateScrollPicker: current dateScrollPicker
     - parameter date: cell date
     - returns: attributed string
     */
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, separatorTopAttributedStringByDate date: Date) -> NSAttributedString?
    
    /**
     ------------------------------------------------------------------------------------------
     Returns custom attributed string for separator bottom label
     ------------------------------------------------------------------------------------------
     - parameter dateScrollPicker: current dateScrollPicker
     - parameter date: cell date
     - returns: attributed string
     */
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, separatorBottomAttributedStringByDate date: Date) -> NSAttributedString?
    
    /**
     ------------------------------------------------------------------------------------------
     Returns custom attributed string for data label
     ------------------------------------------------------------------------------------------
     - parameter dateScrollPicker: current dateScrollPicker
     - parameter date: cell date
     - returns: attributed string
     */
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, dataAttributedStringByDate date: Date) -> NSAttributedString?
    
    /**
     ------------------------------------------------------------------------------------------
     Returns custom color for dot view
     ------------------------------------------------------------------------------------------
     - parameter dateScrollPicker: current dateScrollPicker
     - parameter date: cell date
     - returns: dot color
     */
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, dotColorByDate date: Date) -> UIColor?
}

public extension DateScrollPickerDataSource {
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, topAttributedStringByDate date: Date) -> NSAttributedString? {
        // Optional
        return nil
    }
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, mediumAttributedStringByDate date: Date) -> NSAttributedString? {
        // Optional
        return nil
    }
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, bottomAttributedStringByDate date: Date) -> NSAttributedString? {
        // Optional
        return nil
    }
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, separatorTopAttributedStringByDate date: Date) -> NSAttributedString? {
        // Optional
        return nil
    }
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, separatorBottomAttributedStringByDate date: Date) -> NSAttributedString? {
        // Optional
        return nil
    }
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, dataAttributedStringByDate date: Date) -> NSAttributedString? {
        // Optional
        return nil
    }
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, dotColorByDate date: Date) -> UIColor? {
        // Optional
        return nil
    }
}

public protocol DateScrollPickerDelegate: class {
    
    /**
    ------------------------------------------------------------------------------------------
    Is called when date is selected
    ------------------------------------------------------------------------------------------
    - parameter dateScrollPicker: current dateScrollPicker
    - parameter date: selected date
    */
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, didSelectDate date: Date)
}

public extension DateScrollPickerDelegate {
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, didSelectDate date: Date) {
        // Optional
    }
}

public protocol DateScrollPickerInterface {
    
    /**
     ------------------------------------------------------------------------------------------
     Scroll to current date with selection
     ------------------------------------------------------------------------------------------
     - parameter animated: animation enabled
     */
    func selectToday(animated: Bool?)
    
    /**
     ------------------------------------------------------------------------------------------
     Scroll to date with selection
     ------------------------------------------------------------------------------------------
     - parameter date: date to scroll
     - parameter animated: animation enabled
     */
    func selectDate(_ date: Date, animated: Bool?)
    
    /**
     ------------------------------------------------------------------------------------------
     Scroll to date
     ------------------------------------------------------------------------------------------
     - parameter date: date to scroll
     - parameter animated: animation enabled
     */
    func scrollToDate(_ date: Date, animated: Bool?)
}
