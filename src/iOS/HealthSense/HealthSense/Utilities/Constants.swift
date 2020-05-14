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


// MARK: Error Enumerations
enum HSErrorMsg: String, CaseIterable {
    // Error strings
    case kErrorNetwork = "Unable to fetch data"
    case kErrorProcessing = "Can't process data"
    case kErrorData = "Incorrect data"
    case kErrorFormat = "Incorrect format"
    case kErrorSystem = "System error occurred"
    case kErrorSend = "Couldn't send data"
    case kErrorAck = "Server didn't respond to the request"
}

enum HSFunnyErrorMsg: String, CaseIterable {
    // Error strings
    case kErrorFun1 = "Servers bill weren't paid"
    case kErrorFun2 = "It’s time to get a life."
    case kErrorFun3 = "Our developers weren't paid enough to fix this bug."
    case kErrorFun4 = "Windows not activated!"
    case kErrorFun5 = "No error occured"
    case kErrorFun6 = "PAGE_FAULT_IN_NONPAGED_AREA"
    case kErrorFun7 = "Blue Screen of DEATH!"
    case kErrorFun8 = "Error terminating child"
}


// MARK: API Endpoints Enumerations
enum HSAPI: String {
    // App Links strings
    case kAPIProgrammerQuote = "https://programming-quotes-api.herokuapp.com/quotes/random/lang/en"
    case kAPI1 = "https://sensehack.github.io/health-sense/"
    case kAPI2 = "https://github.com/SensehacK/health-sense/projects"
    case kAPI3 = "https://github.com/SensehacK/health-sense/pulse"
    case kAPI4 = "https://github.com/SensehacK/health-sense/wiki"
    case kAPI5 = "https://github.com/SensehacK/health-sense/issues"
    case kAPI6 = "https://github.com/SensehacK/health-sense/graphs/contributors"
    case kAPI7 = "https://sensehack.github.io/health-sense/#team"
}


// MARK: App Information Enumerations
enum HSAppLinks: String {
    // App Links strings
    case kAppCode = "https://github.com/SensehacK/health-sense"
    case kAppWeb = "https://sensehack.github.io/health-sense/"
    case kAppProject = "https://github.com/SensehacK/health-sense/projects"
    case kAppPulse = "https://github.com/SensehacK/health-sense/pulse"
    case kAppWiki = "https://github.com/SensehacK/health-sense/wiki"
    case kAppBug = "https://github.com/SensehacK/health-sense/issues"
    case kAppContributors = "https://github.com/SensehacK/health-sense/graphs/contributors"
    case kAppTeam = "https://sensehack.github.io/health-sense/#team"
}

enum HSTeam: String, CaseIterable {
    // Team strings
    case kTeam1 = "Abbas"
    case kTeam2 = "Endri"
    case kTeam3 = "Kautilya"
    case kTeam4 = "Manasi"
    case kTeam5 = "Rushikesh"
}

enum HSTeamRole: String, CaseIterable {
    // Team Roles strings
    case kTeamD1 = "Front End Dev"
    case kTeamD2 = "Android Dev"
    case kTeamD3 = "iOS Dev"
    case kTeamD4 = "Business Analyst"
    case kTeamD5 = "Project Manager"
}

enum HSHeartEmoji: String, CaseIterable {
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
    static let kAnime = ["Goku", "Luffy", "Ichigo", "L", "Zoro", "Spike", "Edward", "Inuyasha", "Eren", "Saitama"]
    static let kMusic = ["Alicia Keys", "Bruno Mars", "Daft Punk", "Ed Sheeran", "Imagine Dragons", "Juicy J", "Queen", "The Chainsmokers", "The Rolling Stones", "Tyga"]
    static let kDog = ["Basenji Dog", "Bombay", "Carolina Dog", "Chow Chow", "Dog", "Fire Toad", "Gar", "Giant Clam", "Saint Bernard", "Shrimp"]
    static let kGaming = ["John Marston", "Master Chief", "Link", "Mario", "Solid Snake", "Princess Peach", "Lara Croft",
                          "Geralt", "Cloud Strife", "Pacman", "Kratos", "Megaman", "Marcus Fenix", "Cortana", "Sonic", "Donkey Kong", "Agent 47", "Ezio" ]
    static let kSuperHero = ["Batman", "Spiderman", "Ironman", "Dr.Strange", "Superman", "Wonder Woman", "Flash", "Wolverine", "Captain America"]
    static let kVillain = ["The Joker", "Darth Vader", "V", "Bane", "Hal", "Wonder Woman", "Flash", "Wolverine",
                            "Thanos", "Madara", "T-1000", "Freddy Krueger", "Agent Smith", "Gollum", "Voldemort",
                            "Hans Landa", "Hannibal Lecter", "Loki"]
    static let kBillionaires = ["Bill", "Warren", "Jeff", "Steve", "Bill", "Warren", "Jeff", "Steve"]
    static let kRapper = ["Marshall", "J.Cole", "Kendrick", "Dr. Dre", "Notorious BIG", "Tupac", "50 Cent", "Snoop" ]
    static let kPokemon = ["Pikachu", "Mewtwo", "Bulbasaur", "Eevee", "Charizard", "Dragonite", "Blastoise", "Gengar", "Snorlax", "Squirtle", "Charmander", "Jigglypuff" ]
    static let kStarWars = ["Luke Skywalker", "Yoda", "Han Solo", "Obi-Wan", "Anakin Skywalker ", "Princess Leia", "Chewbacca", "Emperor", "R2-D2", "Boba Fett", "C-3PO"]
    static let kMovieCharacters = ["Indiana Jones", "James Bond", "Katniss", "Ellen Ripley", "John McClane",
                                   "Michael Corleone", "Captain Jack Sparrow", "Aragorn", "Doc Brown", "The Terminator" ,
                                   "Gandalf", "Rocky", "Sarah Connor", "E.T.", "Neo", "Ethan Hunt"]
    static let kWorldPeople = ["Ermir", "Joe", "Arjun", "Ahmed", "Santiago", "James", "Gang, 国 ", "Ben", "Gabriel", "Leonardo"]
    static let kUserNameArr = [kAnime, kMusic, kDog, kGaming, kSuperHero, kVillain, kBillionaires, kRapper, kPokemon, kStarWars, kMovieCharacters, kWorldPeople]
}
