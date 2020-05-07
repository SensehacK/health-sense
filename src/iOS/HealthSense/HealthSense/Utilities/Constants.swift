//
//  Constants.swift
//  HealthSense
//
//  Created by Sensehack on 4/20/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import UIKit


struct HSColors {
    // Colors
    static let sensehackDarkGrey = UIColor(red: 69/255, green: 69/255, blue: 69/255, alpha: 1)
    static let primaryColor1 = UIColor(red: 69/255, green: 69/255, blue: 69/255, alpha: 1)
    static let primaryColor2 = UIColor(red: 69/255, green: 69/255, blue: 69/255, alpha: 1)
    static let secondaryColor1 = UIColor(red: 69/255, green: 69/255, blue: 69/255, alpha: 1)
    static let secondaryColor2 = UIColor(red: 69/255, green: 69/255, blue: 69/255, alpha: 1)
    static let defaultColor = UIColor(red: 69/255, green: 69/255, blue: 69/255, alpha: 1)
}

struct HSFonts {
    // Font
    static let kAvenirNextMedium = "AvenirNext-Medium"
}


struct HSHealthKit {
    // HealthKit data types
    static let kHeartRate = "HKHeartRate"
    static let kPulseRate = "HKPulseRate"
    static let kCalories = "HKCalories"
    static let kWater = "HKHydration"
    static let kSleep = "HKSleep"
    static let kWorkout = "HKWorkout"
    static let kHeight = "HKHeight"
    static let kWeight = "HKWeight"
    static let kDob = "HKDateOfBirth"
}


// MARK: View Enumerations

enum HSStoryboard: String {
    // Custom VCs
    case kSummary = "SummaryViewController"
    case kHealthVC = "HealthBookViewController"
    case kSettingsVC = "SettingsViewController"
    case kOnboardingVC = "OnboardingViewController"
    case kLaunchVC = "LaunchScreen"
    case kHomeVC = "ViewController"
    case kTabBarVC = "UITabBarViewController"
}

enum HSCustomViewController: String {
    // Custom VCs
    case kSummaryVC = "SummaryViewController"
    case kHealthVC = "HealthBookViewController"
    case kSettingsVC = "SettingsViewController"
    case kOnboardingVC = "OnboardingViewController"
    case kLaunchVC = "LaunchScreen"
    case kHomeVC = "ViewController"
    case kTabBarVC = "UITabBarViewController"
}

enum HSOnboardViewController: String {
    // Onboarding VCs
    case kFirstVC = "FirstOnboardingVC"
    case kSecondVC = "SecondOnboardingVC"
    case kThirdVC = "ThirdOnboardingVC"
}

enum HSMainChildVC: String {
    // Main Child VCs
    case kSummaryVC = "SummaryChildVC"
    case kHealthVC = "HealthChildVC"
    case kSettingsVC = "SettingsChildVC"
}


// MARK: Network Enumerations

enum HSHttpStatusCode: Int {
    // HTTPS response Codes
    case kStatusSuccess              = 200
    case kStatusBadRequest           = 400
    case kStatusSessionExpired       = 401
    case kStatusForbidden            = 403
    case kStatusNotFound             = 404
    case kStatusInternalError        = 500
    case kStatusServiceUnavilable    = 503
    case kStatusTimeout              = -1001
    case kStatusResourceNotFound     = -1003
    case kStatusServerUnavialable    = -1004
    case kStatusServerdown           = -1005
    case kStatusNoNetConnection      = -1009
}

// MARK: Misc Enumerations
enum HSSenseMotivationQuotes: String {
    // Motivation strings
    case kSensehack1 = "Just be yourself!"
    case kSensehack2 = "Stay Original!"
    case kSensehack3 = "Live your life!"
    case kSensehack4 = "Express yourself!"
    case kSensehack5 = "Enjoy yourself!"
    case kSensehack6 = "Don't Regret!"
    case kSensehack7 = "You're unique!"
}

// MARK: User Defaults Enumerations
enum HSUserDefaults: String {
    // User Defaults
    case kFirstLaunch = "FirstLaunch"
    case kAppLaunch = "AppOpen"
    case kRandomUser = "RandomUserName"
    case kSecurity = "Authentication"
    case kDarkMode = "DarkMode"
}

// MARK: Misc UserNames
struct HSUserName {
    // Username strings
    static let kUserName1 = ["Goku", "Luffy", "Ichigo", "L", "Zoro", "Spike", "Edward", "Inuyasha", "Eren", "Saitama"]
    static let kUserName2 = ["Alicia Keys", "Bruno Mars", "Daft Punk", "Ed Sheeran", "Imagine Dragons", "Juicy J", "Queen", "The Chainsmokers", "The Rolling Stones", "Tyga"]
    static let kUserName3 = ["Basenji Dog", "Bombay", "Carolina Dog", "Chow Chow", "Dog", "Fire-Bellied Toad", "Gar", "Giant Clam", "Saint Bernard", "Shrimp"]
    static let kUserName4 = ["Clauncher", "Druddigon", "Ferrothorn", "Gloom", "Hawlucha", "Hippopotas", "Honchkrow", "Leafeon", "Porygon-Z", "Wurmple"]
    static let kUserName5 = ["Green Arrow", "Jean Grey", "Kitty Pryde", "Raphael", "The Atom", "The Tick", "Wally West (The Flash)", "Wolverine"]
    static let kUserName6 = ["Bill", "Warren", "Jeff", "Steve", "Bill", "Warren", "Jeff", "Steve"]
    static let kUserName7 = ["Marshall", "J.Cole", "Kendrick", "Dr. Dre", "Notorious BIG", "Tupac", "50 Cent", "Snoop" ]
    static let kUserNameArr = [kUserName1, kUserName2, kUserName3, kUserName4, kUserName5, kUserName6, kUserName7]
}
