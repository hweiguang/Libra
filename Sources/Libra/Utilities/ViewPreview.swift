//
//  ViewPreview.swift
//  
//
//  Created by Wei Guang Heng on 3/1/23.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
public struct ViewPreview<View: UIView>: UIViewRepresentable {
    private let view: UIView
    
    public init(_ builder: @escaping () -> UIView) {
        view = builder()
    }
    
    public func makeUIView(context: Context) -> some UIView {
        view
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
#endif
