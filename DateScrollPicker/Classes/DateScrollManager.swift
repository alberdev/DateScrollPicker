//
//  DateScrollManager.swift
//  DateScrollPicker
//
//  Created by Alberto Aznar de los Ríos on 15/11/2019.
//  Copyright © 2019 Alberto Aznar de los Ríos. All rights reserved.
//

import UIKit

/// /////////////////////////////////////////////////////////////////////////
/// DateScrollManager is used to manage seconday actions like
/// including new cells in collection view at the beginning or at the
/// end of collection.

public class DateScrollManager {
    
    var loadingMore = false
    var format = DateScrollPickerFormat()
}

// PUBLIC

extension DateScrollManager {
    
    func insertPreviousMonthDays(current: [DateScrollItem]) -> [DateScrollItem] {
        return previousMonthDays(from: current[0])
    }
    
    func insertNextMonthDays(current: [DateScrollItem]) -> [DateScrollItem] {
        return nextMonthDays(from: current[current.count - 1])
    }
    
    func insert(_ insert: DateInsertType, count: Int, inCollectionView collectionView: UICollectionView) {
        let contentWidth = collectionView.contentSize.width
        let offsetX = collectionView.contentOffset.x
        let leftOffset = contentWidth - offsetX

        CATransaction.begin()
        CATransaction.setDisableActions(true)

        collectionView.performBatchUpdates({
            var indexPaths = [IndexPath]()
            for i in 0 ..< count {
                let index = 0 + i
                indexPaths.append(IndexPath(item: index, section: 0))
            }
            if indexPaths.count > 0 {
                collectionView.insertItems(at: indexPaths)
            }
            }, completion: {
                finished in
                if insert == .previous {
                    collectionView.contentOffset = CGPoint(x: collectionView.contentSize.width - leftOffset, y: 0)
                }
                CATransaction.commit()
                self.loadingMore = false
        })
    }
}

// PRIVATE

extension DateScrollManager {
    
    private func previousMonthDays(from: DateScrollItem) -> [DateScrollItem] {
        let monthStartDate = from.date.addMonth(-1)!
        let monthEndDate = from.date
        var currentDate = monthStartDate
        var days = [DateScrollItem]()
        
        if format.separatorEnabled {
            days.append(DateScrollItem(date: currentDate, selected: false, separator: true))
        }
        while currentDate < monthEndDate {
            days.append(DateScrollItem(date: currentDate, selected: currentDate == Date.today(), separator: false))
            currentDate = currentDate.addDays(1)!
        }
        
        return days
    }
    
    private func nextMonthDays(from: DateScrollItem) -> [DateScrollItem] {
        let monthStartDate = from.date
        let monthEndDate = monthStartDate.addMonth(1)!
        var currentDate = monthStartDate
        var days = [DateScrollItem]()
        
        while currentDate < monthEndDate {
            days.append(DateScrollItem(date: currentDate, selected: currentDate == Date.today(), separator: false))
            currentDate = currentDate.addDays(1)!
        }
        if format.separatorEnabled {
            days.append(DateScrollItem(date: monthEndDate, selected: false, separator: true))
        }
        return days
    }
}
