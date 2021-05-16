//
//  UIScrollView+Extension.swift
//
//  Copyright © 2021 Wei Guang. All rights reserved.
//

#if os(iOS)
import UIKit

public extension UIScrollView {
    var numberOfPages: Int { lround(Double(self.contentSize.width / self.frame.size.width)) }
    var currentPage: Int { lround(Double(self.contentOffset.x / self.frame.size.width)) }
    
    func scrollContentX(page: Int, animated: Bool) {
        self.setContentOffset(CGPoint(x: Int(self.frame.size.width) * page, y: 0), animated: animated)
    }
    
    func scrollContentY(page: Int, animated: Bool) {
        self.setContentOffset(CGPoint(x: 0, y: Int(self.frame.size.height) * page), animated: animated)
    }
}
#endif
