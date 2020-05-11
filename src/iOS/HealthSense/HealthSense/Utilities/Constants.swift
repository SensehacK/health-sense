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
    case kSummary = "Summary"
    case kHealthVC = "HealthBook"
    case kSettingsVC = "Settings"
    case kOnboardingVC = "Onboarding"
    case kLaunchVC = "LaunchScreen"
    case kHomeVC = "Main"
    case kTabBarVC = "UITabBar"
    case kCustomVC = "Custom"
    case kBarChart = "BarChart"
    case kCircularPieChart = "CircularPieChart"
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
    case kCustomVC = "CustomViewController"
    case kCircularPieVC = "CircularPieChartViewController"
    case kBarChartVC = "BarChartViewController"
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


enum HSStoryboardSegue: String {
    // Storyboard Segues
    case kSummaryS = "SummaryChildSegue"
    case kHealthS = "HealthChildSegue"
    case kSettingsS = "SettingsChildSegue"
    case kOnboardingS = "GoToOnboarding"
    case kOnboardingViewS = "onboarding"
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
enum HSSenseMotivationQuotes: String, CaseIterable {
    // Motivation strings
    case kSensehack1 = "Just be yourself!"
    case kSensehack2 = "Stay Original!"
    case kSensehack3 = "Live your life!"
    case kSensehack4 = "Express yourself!"
    case kSensehack5 = "Enjoy yourself!"
    case kSensehack6 = "Don't Regret!"
    case kSensehack7 = "You're unique!"
}

enum HSTeam: String, CaseIterable {
    // Team strings
    case kTeam1 = "Abbas Shamshi"
    case kTeam2 = "Endri Zylali"
    case kTeam3 = "Kautilya Save"
    case kTeam4 = "Manasi Tayade"
    case kTeam5 = "Rushikesh Nage"
}

enum HSTeamRole: String, CaseIterable {
    // Team Roles strings
    case kTeamD1 = "Front End Dev"
    case kTeamD2 = "Android Dev"
    case kTeamD3 = "iOS Dev"
    case kTeamD4 = "Business Analyst"
    case kTeamD5 = "Project Manager"
}

enum HSEmoji: String, CaseIterable {
    // Emoji strings
    case kEmoji1 = "\u{1F49B}"
    case kEmoji2 = "\u{1F9E1}"
    case kEmoji3 = "\u{1F49A}"
    case kEmoji4 = "\u{1F499}"
    case kEmoji5 = "\u{1F49C}"
    case kEmoji6 = "\u{1F90E}"
    case kEmoji7 = "\u{1F5A4}"
    case kEmoji8 = "\u{1F90D}"
}

// MARK: User Defaults Enumerations
enum HSUserDefaults: String {
    // User Defaults
    case kFirstLaunch = "FirstLaunch"
    case kAppLaunch = "AppOpen"
    case kRandomUser = "RandomUserName"
    case kSecurity = "Authentication"
    case kDarkMode = "DarkMode"
    case kAnalytics = "Analytics"
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
