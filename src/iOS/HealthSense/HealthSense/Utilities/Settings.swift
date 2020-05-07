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
    
    private override init() {}
    
    let appVersion: Double = 1.0
    let buildNumber: String = "276"
    static let saf = 12
    
       // MARK: - Accessors

       func settingsDict() -> SettingsStruct {
        return SettingsStruct()
       }
    
    
    
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
}

struct AnalyticsStruct {
    // Analytics Global space
    static var appOpen = 1
}
