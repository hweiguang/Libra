//
//  UIStoryboardSegueWithCompletion.swift
//  
//
//  Created by Wei Guang
//

#if os(iOS)
import UIKit

public class UIStoryboardSegueWithCompletion: UIStoryboardSegue {
    var completion: (() -> Void)?
    
    override func perform() {
        super.perform()
        completion?()
    }
}
#endif
