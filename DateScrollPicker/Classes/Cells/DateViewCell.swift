//
//  DateViewCell.swift
//  DateScrollPicker
//
//  Created by Alberto Aznar de los Ríos on 13/11/2019.
//  Copyright © 2019 Alberto Aznar de los Ríos. All rights reserved.
//

import UIKit

protocol DateViewCellDataSource {
    func dateViewCell(_ dateViewCell: DateViewCell, topAttributedStringByDate date: Date) -> NSAttributedString?
    func dateViewCell(_ dateViewCell: DateViewCell, mediumAttributedStringByDate date: Date) -> NSAttributedString?
    func dateViewCell(_ dateViewCell: DateViewCell, bottomAttributedStringByDate date: Date) -> NSAttributedString?
    func dateViewCell(_ dateViewCell: DateViewCell, dataAttributedStringByDate date: Date) -> NSAttributedString?
    func dateViewCell(_ dateViewCell: DateViewCell, dotColorByDate date: Date) -> UIColor?
}

final class DateViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var mediumLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var topContainerConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomContainerConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightContainerConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftContainerConstraint: NSLayoutConstraint!
    @IBOutlet weak var dataLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var dotView: UIView!
    @IBOutlet weak var dotViewHeightConstraint: NSLayoutConstraint!
    
    var dataSource: DateViewCellDataSource?
    
    /// Cell date
    var date: Date = Date() {
        didSet {
            topLabel.attributedText = dataSource?.dateViewCell(self, topAttributedStringByDate: date)
            mediumLabel.attributedText = dataSource?.dateViewCell(self, mediumAttributedStringByDate: date)
            bottomLabel.attributedText = dataSource?.dateViewCell(self, bottomAttributedStringByDate: date)
            dataLabel.attributedText = dataSource?.dateViewCell(self, dataAttributedStringByDate: date)
            dotView.backgroundColor = dataSource?.dateViewCell(self, dotColorByDate: date) ?? .clear
            
            let emptyData = dataSource?.dateViewCell(self, dataAttributedStringByDate: date) == nil
            let emptyDot = dataSource?.dateViewCell(self, dotColorByDate: date) == nil
            dotViewHeightConstraint.constant = emptyDot ? 0 : format.dotWidth
            dataLabelTopConstraint.constant = (emptyData && emptyDot) ? 0 : format.topMarginData
        }
    }
    
    /// Format cell
    var format = DateScrollPickerFormat() {
        didSet {
            topLabel.font = format.topFont
            mediumLabel.font = format.mediumFont
            bottomLabel.font = format.bottomFont
            containerView.layer.cornerRadius = format.dayRadius
            containerView.clipsToBounds = true
            topContainerConstraint.constant = format.dayPadding
            bottomContainerConstraint.constant = format.dayPadding
            rightContainerConstraint.constant = format.dayPadding
            leftContainerConstraint.constant = format.dayPadding
        }
    }
    
    /// Highlighted
    var isOn: Bool = false {
        didSet {
            containerView.backgroundColor = isOn ? format.dayBackgroundSelectedColor : format.dayBackgroundColor
            topLabel.textColor = isOn ? format.topTextSelectedColor : format.topTextColor
            mediumLabel.textColor = isOn ? format.mediumTextSelectedColor : format.mediumTextColor
            bottomLabel.textColor = isOn ? format.bottomTextSelectedColor : format.bottomTextColor
            // isSelected = isOn
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dotView.layer.cornerRadius = 5
        dotView.clipsToBounds = true
    }
}

extension DateViewCell {
    
    /// Selection animation with damping
    func animateSelection(completion: ((Bool) -> Void)?) {
        containerView.transform = CGAffineTransform(scaleX: format.animationScaleFactor, y: format.animationScaleFactor)
        isOn = true
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .curveEaseIn, animations: {
            self.containerView.transform = CGAffineTransform.identity
        }, completion: completion)
    }
}
