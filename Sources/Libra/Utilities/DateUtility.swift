//
//  DateUtility.swift
//
//
//  Created by Wei Guang
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
