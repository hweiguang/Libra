//
//  UIView+Extension.swift
//
//
//  Created by Wei Guang
//

#if canImport(UIKit)
import UIKit

public extension UIView {
    func addDropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
}
#endif
