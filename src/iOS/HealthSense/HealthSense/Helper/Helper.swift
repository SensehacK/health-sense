//
//  Helper.swift
//  HealthSense
//
//  Created by Sensehack on 4/26/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import HealthKit

public typealias CompletionHandler = ((HKQuantity?, Error?) -> Void)

// Class for the whole project helper methods.
class Helper {
    
    let healthKitManager = HealthKitManager.sharedInstance
    
    init() {
        
        print("#### Helper Class")
    }
    
    //TODO: Reusable function for querying the Healthkit datastore to just pass the last result of a particular HKType
    func readLastSample() {
        
    }
    
    func readBodyMassWithComp( completion: @escaping CompletionHandler) {
        
//        var bodyWeight: HKQuantity
        
//        let weightType = healthKitManager.healthStore.HKRead
        guard let weightType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass) else { return }
        
        print("Debug readBodyMassWithComp Completion func Body Mass with Comp")
        
        let query = HKSampleQuery(sampleType: weightType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, results, error) in
            if let results = results?.last as? HKQuantitySample {
                print("Weight: \(results.quantity)")
                print("Query: \(query)")
                let bodyWeight = results.quantity
                completion(bodyWeight, nil)
            } else {
                print("Couldn't get Weight data \(String(describing: error))")
                completion(nil, error)
            }
            
        }
        healthKitManager.healthStore.execute(query)
    
    }
    
    
     func readBodyMass() {
        
        guard let weightType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass) else { return }
        print("In read Body Mass")
        
        let query = HKSampleQuery(sampleType: weightType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, results, error) in
                if let results = results?.last as? HKQuantitySample {
                    print("Weight: \(results.quantity)")
                    print("Query: \(query)")
                    let bodyWeight = results.quantity
                    let weightUnit = HKUnit.pound()
                    let usersWeight: Double = bodyWeight.doubleValue(for: weightUnit)
                    UserStruct.weight = usersWeight

                } else {
                    print("Couldn't get Weight data \(String(describing: error))")
                }
            
            }
        healthKitManager.healthStore.execute(query)
        }
    
}
