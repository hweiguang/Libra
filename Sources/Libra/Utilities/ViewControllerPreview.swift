//
//  ViewControllerPreview.swift
//  
//
//  Created by Wei Guang Heng on 3/1/23.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
public struct ViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    private let viewController: UIViewController
    
    public init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }
    
    public func makeUIViewController(context: Context) -> UIViewController {
        viewController
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
#endif
