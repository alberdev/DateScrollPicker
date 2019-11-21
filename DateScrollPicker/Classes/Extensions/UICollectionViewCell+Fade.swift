//
//  UICollectionViewCell+Fade.swift
//  DateScrollPicker
//
//  Created by Alberto Aznar de los Ríos on 17/11/2019.
//  Copyright © 2019 Alberto Aznar de los Ríos. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    
    func updateFade() {
        guard let collectionView = self.superview as? UICollectionView else { return }
        let middle = collectionView.contentOffset.x - frame.size.width / 2 + collectionView.frame.size.width / 2
        let distance = middle - frame.origin.x
        let limit = 3 * collectionView.frame.size.width / 8
        
        var rest: CGFloat = 0
        if distance > limit { rest = distance - limit }
        if distance < -limit { rest = -limit - distance }
        
        var factor = 1.2 * rest / limit
        if factor >= 1 { factor = 1 }
        if factor <= 0 { factor = 0 }
        alpha = 1 - factor
    }
}
