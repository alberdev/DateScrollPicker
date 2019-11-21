//
//  Date+Tools.swift
//  DateScrollPicker
//
//  Created by Alberto Aznar de los Ríos on 13/11/2019.
//  Copyright © 2019 Alberto Aznar de los Ríos. All rights reserved.
//

import Foundation

extension Date {
    
    func format(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}


