//
//  User.swift
//  HealthSense
//
//  Created by Sensehack on 4/26/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation

class User: NSObject {
    
    //TODO: Shared Instance Singleton
    static let sharedInstance = User()
    
    private override init() {}
    
       // MARK: - Accessors

       func userDict() -> UserStruct {
        return UserStruct()
       }
    
}

// MARK: User Details
struct UserStruct {
    // App User
    static var displayName: String?
    static var firstName: String?
    static var lastName: String?
    static var age: Int?
    static var weight: Double?
    static var height: Int?
    static var blood: String?
    static var gender: String?
    static var heartRate: Double?
}
