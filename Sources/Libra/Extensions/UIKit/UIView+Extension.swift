//
//  UIView+Extension.swift
//
//  Copyright © 2021 Wei Guang. All rights reserved.
//

import UIKit

public extension UIView {
    func addDropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 1
    }
}
