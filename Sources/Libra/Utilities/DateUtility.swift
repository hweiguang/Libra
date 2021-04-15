//
//  DateUtility.swift
//  Affinity
//
//  Created by Wei Guang on 28/2/21.
//  Copyright © 2021 Wei Guang. All rights reserved.
//

import Foundation

public struct DateUtility {
    public static var currentDay: Int {
        return Calendar.current.component(.day, from: Date())
    }
    
    public static var currentMonth: Int {
        return Calendar.current.component(.month, from: Date())
    }
    
    public static var currentYear: Int {
        return Calendar.current.component(.year, from: Date())
    }
}
