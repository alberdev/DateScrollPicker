//
//  UICollectionView+Fade.swift
//  DateScrollPicker
//
//  Created by Alberto Aznar de los Ríos on 15/11/2019.
//  Copyright © 2019 Alberto Aznar de los Ríos. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func updateFadeCells() {
        for cell in self.visibleCells {
            cell.updateFade()
        }
    }
}
