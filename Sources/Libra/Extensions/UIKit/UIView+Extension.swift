//
//  UIView+Extension.swift
//
//  Copyright © 2021 Wei Guang. All rights reserved.
//

import UIKit

public extension UIView {
    func addDropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0.75, height: 0.75)
        layer.shadowRadius = 1
    }
}
