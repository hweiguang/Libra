//
//  UIStoryboardSegueWithCompletion.swift
//  
//
//  Created by Wei Guang
//

#if os(iOS)
import UIKit

public class UIStoryboardSegueWithCompletion: UIStoryboardSegue {
    public var completion: (() -> Void)?
    
    public override func perform() {
        super.perform()
        completion?()
    }
}
#endif
