//
//  Settings.swift
//  HealthSense
//
//  Created by Sensehack on 4/23/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation


class Settings: NSObject {
    
    // TODO: Shared Instance Singleton
    static let sharedInstance = Settings()
    
    //Variables
    let defaults = UserDefaults.standard
    
    private override init() {}
    
    let appVersion: Double = 1.0
    let buildNumber: String = "276"
    static let saf = 12
    
    // MARK: - Accessors
    func settingsDict() -> SettingsStruct {
        return SettingsStruct()
    }
    
    // func for initializing persistent app settings
    func setAppSettings() {
        print("set App Settings")
        SettingsStruct.defaultScreen = HSRouter.kWelcome.rawValue
        defaults.set(true, forKey: HSUserDefaults.kFirstLaunch.rawValue)
        defaults.set(0, forKey: HSUserDefaults.kAppLaunch.rawValue)
        setRandomUserName() // Set RandomUser settings
        setSecurity() // Set Security settings
        setDarkMode() // Set Dark Mode settings
        setAnalytics() // Set Analytics settings
        setMetrics() // Set Metrics settings
    }
    
    
    // func for restoring persistent app settings
    func appRestoreSettings() {
        print("restore App Settings")
        SettingsStruct.defaultScreen = HSRouter.kSummary.rawValue
        retrieveRandomUserName() // Refresh latest settings
        retrieveSecurity() // Refresh Security settings
        retrieveDarkMode() // Refresh Dark Mode settings
        retrieveAnalytics() // Refresh Analytics settings
        retrieveMetrics() // Refresh Metrics settings
    }
    

    // func for retrieving isRandomUserName User Default setting
    func retrieveRandomUserName() {
        SettingsStruct.isRandomUserName = defaults.bool(forKey: HSUserDefaults.kRandomUser.rawValue)
    }
    
    // func for Saving RandomUser preference to User Defaults
    func setRandomUserName() {
        defaults.set(SettingsStruct.isRandomUserName, forKey: HSUserDefaults.kRandomUser.rawValue)
    }
    
    // func for retrieving isRandomUserName User Default setting
    func retrieveSecurity() {
        SettingsStruct.isSecurity  = defaults.bool(forKey: HSUserDefaults.kSecurity.rawValue)
    }
    
    // func for Saving RandomUser preference to User Defaults
    func setSecurity() {
        defaults.set(SettingsStruct.isSecurity, forKey: HSUserDefaults.kSecurity.rawValue)
    }
    
    // func for retrieving isRandomUserName User Default setting
    func retrieveDarkMode() {
        SettingsStruct.isDarkMode  = defaults.bool(forKey: HSUserDefaults.kDarkMode.rawValue)
    }
    
    // func for Saving RandomUser preference to User Defaults
    func setDarkMode() {
        defaults.set(SettingsStruct.isDarkMode, forKey: HSUserDefaults.kDarkMode.rawValue)
    }
    
    // func for retrieving isRandomUserName User Default setting
    func retrieveAnalytics() {
        SettingsStruct.isAnalytics  = defaults.bool(forKey: HSUserDefaults.kAnalytics.rawValue)
    }
    
    // func for Saving RandomUser preference to User Defaults
    func setAnalytics() {
        defaults.set(SettingsStruct.isAnalytics, forKey: HSUserDefaults.kAnalytics.rawValue)
    }
    
    // func for retrieving isRandomUserName User Default setting
    func retrieveMetrics() {
        SettingsStruct.isMetric = defaults.bool(forKey: HSUserDefaults.kMetric.rawValue)
    }
    
    // func for Saving RandomUser preference to User Defaults
    func setMetrics() {
        defaults.set(SettingsStruct.isMetric, forKey: HSUserDefaults.kMetric.rawValue)
    }
    
}

enum HSRouter: String {
    // Router switch
    case kDefault = "default"
    case kSummary = "summary"
    case kWelcome = "welcome"
    
}



struct SettingsStruct {
    // App Settings
    static var isDarkMode = false
    static var isNotificationTurnedOn = false
    static var isTouchIDEnabled = false
    static var isFaceIDEnabled = false
    static var selectedFontFamily = "Arial"
    static var appLanguage = "en"
    static var isHealthkitAccess = false
    static var cloudDataSharing = false
    static var defaultScreen = "welcome"
    static var isRandomUserName = false
    static var isSecurity = false
    static var isAnalytics = true
    static var isColorMode = false
    static var isMetric = false
}

struct AnalyticsStruct {
    // Analytics Global space
    static var appOpen = 0
}
