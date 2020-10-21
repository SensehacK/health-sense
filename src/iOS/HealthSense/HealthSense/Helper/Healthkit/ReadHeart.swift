//
//  ReadHeart.swift
//  HealthSense
//
//  Created by Sensehack on 5/25/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import HealthKit


// Class for the Heart Rate project helper methods.
class ReadHeart {
    
    let healthKitManager = HealthKitManager.sharedInstance
    
    init() {
        print("### Heart class")
    }
    
    func readHeartRate(completion: @escaping CompletionHKQuantity) {
        
        var latestHeartRate = 0.0
        guard let sampleType = HKObjectType.quantityType(forIdentifier: .heartRate) else { return }
        
        let startDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
        
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        
        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (_, results, error) in
            
            guard error == nil else { return }
            
            if let lastResult = results?.last as? HKQuantitySample {

                let unit = HKUnit(from: HSHealthKitUnits.kHeartRate.rawValue)
                latestHeartRate = (lastResult.quantity.doubleValue(for: unit))
                print("Latest HR: \(latestHeartRate)")
                completion(lastResult.quantity, nil)
            } else {
                print("Couldn't get Heart Rate data \(String(describing: error))")
                completion(nil, error)
            }

        }
        healthKitManager.healthStore.execute(query)
        
    }

}
