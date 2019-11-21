//
//  SeparatorViewCell.swift
//  DateScrollPicker
//
//  Created by Alberto Aznar de los Ríos on 14/11/2019.
//  Copyright © 2019 Alberto Aznar de los Ríos. All rights reserved.
//

import UIKit

final class SeparatorViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var topContainerConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomContainerConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightContainerConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftContainerConstraint: NSLayoutConstraint!
    
    /// Cell date
    var date: Date = Date() {
        didSet {
            monthLabel.text = date.format(dateFormat: format.separatorTopDateFormat).uppercased()
            yearLabel.text = date.format(dateFormat: format.separatorBottomDateFormat)
        }
    }
    
    /// Format cell
    var format = DateScrollPickerFormat() {
        didSet {
            monthLabel.font = format.separatorTopFont
            yearLabel.font = format.separatorBottomFont
            monthLabel.textColor = format.separatorTopTextColor
            yearLabel.textColor = format.separatorBottomTextColor
            containerView.layer.cornerRadius = format.dayRadius
            containerView.clipsToBounds = true
            containerView.backgroundColor = format.separatorBackgroundColor
            topContainerConstraint.constant = format.dayPadding
            bottomContainerConstraint.constant = format.dayPadding
            rightContainerConstraint.constant = format.dayPadding
            leftContainerConstraint.constant = format.dayPadding
        }
    }
}
