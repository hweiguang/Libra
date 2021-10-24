//
//  ViewModelType.swift
//
//
//  Created by Wei Guang
//

import Foundation

public protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}
