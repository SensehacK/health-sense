//
//  ReadProfile.swift
//  HealthSense
//
//  Created by Sensehack on 4/26/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import HealthKit

class ReadProfile {
    
    static let sharedInstance = ReadProfile()
    let healthKitManager = HealthKitManager.sharedInstance
    
    // func for calculating the Date of Birth
    func getDOB() -> (Int) {
        var age: Int?
        // Reading age
        do {
            let birthday = try healthKitManager.healthStore.dateOfBirthComponents()
            let currentYear = Calendar.current.component(.year, from: Date())
            age = currentYear - (birthday.year != nil ? birthday.year!: currentYear )
        } catch {
           print("Error in catching Date of Birth.")
        }
        return age ?? 0
    }
    
    
    // func for calculating the Blood Type
    func getBloodType() -> (String) {
        var bloodTypeText = ""
        var bloodTypeObj: HKBloodTypeObject?
        
        // Reading age
        do {
            bloodTypeObj = try healthKitManager.healthStore.bloodType()
        } catch {
           print("Error in catching Blood Type.")
        }
        
        let bloodType = bloodTypeObj?.bloodType

        if bloodType != nil {
            switch (bloodType) {
            case .aPositive:
                bloodTypeText = "A+"
            case .aNegative:
                bloodTypeText = "A-"
            case .bPositive:
                bloodTypeText = "B+"
            case .bNegative:
                bloodTypeText = "B-"
            case .abPositive:
                bloodTypeText = "AB+"
            case .abNegative:
                bloodTypeText = "AB-"
            case .oPositive:
                bloodTypeText = "O+"
            case .oNegative:
                bloodTypeText = "O-"
            default: break
            }
        }
        return bloodTypeText
    }
    
    
    // func for calculating the Gender
    func getGender() -> (String) {
        var gender: String?
        var genderObj: HKBiologicalSexObject?
        
        // Reading age
        do {
            genderObj = try healthKitManager.healthStore.biologicalSex()
        } catch {
           print("Error in catching Gender.")
        }
        let genderRaw = genderObj?.biologicalSex.rawValue
        
        switch (genderRaw) {
        case 1:
            gender = "Female"
        case 2:
            gender = "Male"
        case 3:
            gender = "Other"
        default:
            break
        }
        return gender ?? "Unknown"
    }


}
