//
//  Dictionary+Extension.swift
//
//
//  Created by Wei Guang
//

import Foundation

public extension Dictionary {
    subscript(i: Int) -> (key: Key, value: Value) {
        return self[index(startIndex, offsetBy: i)]
    }
}
