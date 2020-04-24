//
//  Settings.swift
//  HealthSense
//
//  Created by Sensehack on 4/23/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation


class Settings {
    
    //TODO: Shared Instance Singleton
    private static var sharedSetting: Settings = {
           let networkManager = Settings(baseURL: "Kautilya" )
           // Configuration
           return networkManager
       }()

       // MARK: -

       let baseURL: String

       // Initialization

       private init(baseURL: String) {
           self.baseURL = baseURL
       }

       // MARK: - Accessors

       class func shared() -> Settings {
           return sharedSetting
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
}
