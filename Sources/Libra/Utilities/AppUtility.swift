//
//  AppUtility.swift
//
//  Copyright © 2021 Wei Guang. All rights reserved.
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
    
    public static var documentDirectory: String {
        get {
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path  ?? "N.A"
        }
    }
    
    public static var documentDirectoryUrl: URL? {
        get {
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        }
    }
    
    public static var formattedBundleVersion: String {
        get {
            return "v\(versionNumber)(\(buildNumber))"
        }
    }
    
    static var versionNumber: String {
        get {
            return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "N.A"
        }
    }
    
    static var buildNumber: String {
        get {
            return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "N.A"
        }
    }
}
