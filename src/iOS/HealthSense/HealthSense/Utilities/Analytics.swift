//
//  Analytics.swift
//  HealthSense
//
//  Created by Sensehack on 4/25/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation

class Analytics {
    
    //Variables
    let defaults = UserDefaults.standard
    
    init() {
        print("Analytics Class init")
        retrieveUser() // Function call to fetch User Defaults.
        trackApp() // Function call to track apps.
        saveTrackApp() // Function call to save new settings
    }
    
    // func for retrieving App Tracking from User Defaults to Settings struct
    func retrieveUser() {
        AnalyticsStruct.appOpen = defaults.integer(forKey: "AppOpen")
    }
    
     // func for updating those App analytics variables in Settings struct
    func trackApp() {
        AnalyticsStruct.appOpen += AnalyticsStruct.appOpen
    }
    
    
    // func for Saving App Tracking to User Defaults
    func saveTrackApp() {
        defaults.set(AnalyticsStruct.appOpen, forKey: "AppOpen")
    }
    
}



