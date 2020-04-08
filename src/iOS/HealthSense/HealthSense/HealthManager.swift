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
    
    func authorizeHealthKit(_ completion:  @escaping ((_ success: Bool, _ error: Error?)-> Void)) {
        
        guard let heartRateType: HKQuantityType = HKQuantityType.quantityType(forIdentifier: .heartRate) else {
            return
        }
        
        let heightData: HKQuantityType = HKQuantityType.quantityType(forIdentifier: .height)!
       
        let typesToShare = Set([HKObjectType.workoutType(), heartRateType, heightData])
        let typesToRead = Set([HKObjectType.workoutType(), heartRateType, heightData])
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            print("Was authorization succesful \(success)")
            completion(success, error)
        }
        
    }
}
