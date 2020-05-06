//
//  ProfileM.swift
//  HealthSense
//
//  Created by Sensehack on 5/4/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation

struct ProfileM {
    
    let firstName: String
    let lastName: String
    let age: Int
    let blood: String
    let gender: String
    let weight: Double
    let height: Int
    
    
    init(firstN: String, lastN: String, age: Int, blood: String, gender: String, weight: Double, height: Int) {
        self.firstName = firstN
        self.lastName = lastN
        self.age = age
        self.blood = blood
        self.gender = gender
        self.weight = weight
        self.height = height
    }
    
}
