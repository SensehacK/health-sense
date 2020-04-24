//
//  Constants.swift
//  HealthSense
//
//  Created by Sensehack on 4/20/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import UIKit


struct Colors {
    static let sensehackDarkGrey = UIColor(red: 69/255, green: 69/255, blue: 69/255, alpha: 1)
    
    static let primaryColor1 = UIColor(red: 69/255, green: 69/255, blue: 69/255, alpha: 1)
    
    static let primaryColor2 = UIColor(red: 69/255, green: 69/255, blue: 69/255, alpha: 1)
    
    static let secondaryColor1 = UIColor(red: 69/255, green: 69/255, blue: 69/255, alpha: 1)
    
    static let secondaryColor2 = UIColor(red: 69/255, green: 69/255, blue: 69/255, alpha: 1)
    
    static let defaultColor = UIColor(red: 69/255, green: 69/255, blue: 69/255, alpha: 1)
    
}

struct Fonts {
    static let avenirNextMedium = "AvenirNext-Medium"
}


struct HealthKit {
    static let heartRate = "HKHeartRate"
    static let pulseRate = "HKPulseRate"
    static let calories = "HKCalories"
    static let water = "HKHydration"
    static let sleep = "HKSleep"
    static let workout = "HKWorkout"
    static let height = "HKHeight"
    static let weight = "HKWeight"
    static let dob = "HKDateOfBirth"
}


enum CustomViewController: String {
    case summaryVC = "SummaryViewController"
    case healthVC = "HealthBookViewController"
    case settingsVC = "SettingsViewController"
    case onboardingVC = "OnboardingViewController"
    case launchVC = "LaunchScreen"
    case homeVC = "ViewController"
    case tabBarVCVC = "UITabBarViewController"
}

enum OnboardViewController: String {
    case firstVC = "FirstOnboardingVC"
    case secondVC = "SecondOnboardingVC"
    case thirdVC = "ThirdOnboardingVC"
}


enum HttpStatusCode: Int {
    case statusSuccess              = 200
    case statusBadRequest           = 400
    case statusSessionExpired       = 401
    case statusForbidden            = 403
    case statusNotFound             = 404
    case statusInternalError        = 500
    case statusServiceUnavilable    = 503
    case statusTimeout              = -1001
    case statusResourceNotFound     = -1003
    case statusServerUnavialable    = -1004
    case statusServerdown           = -1005
    case statusNoNetConnection      = -1009
}


enum SenseMotivationQuotes: String {
    case sensehack1 = "Just be yourself!"
    case sensehack2 = "Stay Original!"
    case sensehack3 = "Live your life!"
    case sensehack4 = "Express yourself!"
    case sensehack5 = "Enjoy yourself!"
    case sensehack6 = "Don't Regret!"
    case sensehack7 = "You're unique!"
}

