//
//  AppUtility.swift
//
//
//  Created by Wei Guang
//

import Foundation

public struct AppUtility {
    public static var isFirstLaunch: Bool {
        get {
            guard UserDefaults.standard.bool(forKey: "isFirstLaunch") else {
                UserDefaults.standard.set(true, forKey: "isFirstLaunch")
                return true
            }
            return false
        }
    }
    
    public static var documentDirectory: String? {
        get {
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path
        }
    }
    
    public static var formattedBundleVersion: String {
        get {
            return "v\(versionNumber)(\(buildNumber))"
        }
    }
    
    public static var versionNumber: String {
        get {
            return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "N.A"
        }
    }
    
    public static var buildNumber: String {
        get {
            return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "N.A"
        }
    }
}
