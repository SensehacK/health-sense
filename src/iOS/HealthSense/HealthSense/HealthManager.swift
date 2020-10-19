//
//  HealthManager.swift
//  HealthSense
//
//  Created by Sensehack on 3/25/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import HealthKit

class HealthKitManager: NSObject {
    
    
    static let sharedInstance = HealthKitManager()
    
    private override init() {}
    
    let healthStore = HKHealthStore()
    
    func authorizeHealthKit(_ completion:  @escaping ((_ success: Bool, _ error: Error?)
        -> Void)) {
         
        // Profile HKObject Types
        guard let dateOfBirth: HKObjectType = HKObjectType.characteristicType(forIdentifier: .dateOfBirth) else { return }
        guard let bloodType: HKObjectType = HKObjectType.characteristicType(forIdentifier: .bloodType)  else { return }
        guard let gender: HKObjectType = HKObjectType.characteristicType(forIdentifier: .biologicalSex)  else { return }
        
        
        // HKQuantity Types
        guard let heartRateType: HKQuantityType = HKQuantityType.quantityType(forIdentifier: .heartRate) else { return }
        guard let bodyMass: HKQuantityType = HKQuantityType.quantityType(forIdentifier: .bodyMass)  else { return }
        guard let heightData: HKQuantityType = HKQuantityType.quantityType(forIdentifier: .height) else { return }
       
        // Sets of Read and Write
        let typesToShare = Set([HKObjectType.workoutType(), heartRateType, heightData, bodyMass])
        let typesToRead = Set([HKObjectType.workoutType(), heartRateType, heightData, dateOfBirth, bloodType, gender, bodyMass])
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            print("Authorization successful \(success)")
            print("Was authorization Error \(String(describing: error))")
            completion(success, error)
        }
        
    }
}
