//
//  DateScrollPickerFormat.swift
//  DateScrollPicker
//
//  Created by Alberto Aznar de los Ríos on 13/11/2019.
//  Copyright © 2019 Alberto Aznar de los Ríos. All rights reserved.
//

import UIKit

public struct DateScrollPickerFormat {
    
    /// Number of days
    public var days = 5
    
    /// Top label date format
    public var topDateFormat = "EEE"
    
    /// Top label font
    public var topFont = UIFont.systemFont(ofSize: 10, weight: .regular)
    
    /// Top label text color
    public var topTextColor = UIColor.black
    
    /// Top label selected text color
    public var topTextSelectedColor = UIColor.white
    
    /// Medium label date format
    public var mediumDateFormat = "dd"
    
    /// Medium label font
    public var mediumFont = UIFont.systemFont(ofSize: 30, weight: .bold)
    
    /// Medium label text color
    public var mediumTextColor = UIColor.black
    
    /// Medium label selected text color
    public var mediumTextSelectedColor = UIColor.white
    
    /// Bottom label date format
    public var bottomDateFormat = "MMM"
    
    /// Bottom label font
    public var bottomFont = UIFont.systemFont(ofSize: 10, weight: .regular)
    
    /// Bottom label text color
    public var bottomTextColor = UIColor.black
    
    /// Bottom label selected text color
    public var bottomTextSelectedColor = UIColor.white
    
    /// Day radius
    public var dayRadius: CGFloat = 5
    
    /// Day background color
    public var dayBackgroundColor = UIColor.lightGray
    
    /// Day background selected color
    public var dayBackgroundSelectedColor = UIColor.darkGray
    
    /// Selection animation
    public var animatedSelection = true
    
    /// Separator enabled
    public var separatorEnabled = true
    
    /// Separator top label date format
    public var separatorTopDateFormat = "MMM"
    
    /// Separator top label font
    public var separatorTopFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    
    /// Separator top label text color
    public var separatorTopTextColor = UIColor.black
    
    /// Separator bottom label date format
    public var separatorBottomDateFormat = "yyyy"
       
    /// Separator bottom label font
    public var separatorBottomFont = UIFont.systemFont(ofSize: 20, weight: .regular)
   
    /// Separator bottom label text color
    public var separatorBottomTextColor = UIColor.black
    
    /// Separator background color
    public var separatorBackgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
    
    /// Fade enabled
    public var fadeEnabled = false
    
    /// Animation scale factor
    public var animationScaleFactor: CGFloat = 1.1
    
    /// Animation scale factor
    public var dayPadding: CGFloat = 5
    
    /// Top margin data label
    public var topMarginData: CGFloat = 10
    
    /// Dot view size
    public var dotWidth: CGFloat = 10
    
    public init() {}
}
