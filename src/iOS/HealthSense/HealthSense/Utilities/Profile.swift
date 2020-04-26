//
//  Profile.swift
//  HealthSense
//
//  Created by Sensehack on 4/23/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import UIKit


//TODO: Shared Instance or Global Model Object

class Profile {
    
    let user: User? = nil
    

}

// MARK: User Details
struct User {
    
    static var displayName: String?
    let firstName: String?
    let lastName: String?
    let age: Int?
}

