//
//  URL+Extension.swift
//
//  Created by Wei Guang on 24/3/21.
//  Copyright © 2021 Wei Guang. All rights reserved.
//

import Foundation

public extension URL {
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
    }
}
