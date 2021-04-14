//
//  Dictionary+Extension.swift
//
//  Copyright © 2021 Wei Guang. All rights reserved.
//

import Foundation

public extension Dictionary {
    subscript(i: Int) -> (key: Key, value: Value) {
        return self[index(startIndex, offsetBy: i)]
    }
}
