//
//  ReadActivity.swift
//  HealthSense
//
//  Created by Sensehack on 10/19/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import HealthKit

protocol ActivitySummaryDelegate {

    func activitySummaryUpdated(activitySummary: [HKActivitySummary])

}

class ReadActivity {
    
    let healthKitManager = HealthKitManager.sharedInstance
    
    // MARK: - Delegate
    
    var activitySummaryDelegate: ActivitySummaryDelegate?
    
    init() {
        print("### ReadActivity class")
    }
    
    func readActivity(completion: @escaping CompletionHKActivity) {
        
        let calendar = Calendar.current
        let unitFlags = Set<Calendar.Component>([.day, .month, .year])
        var startDate = calendar.dateComponents(unitFlags, from: Date())
        startDate.calendar = calendar
        
        let summariesPredicate = HKQuery.predicateForActivitySummary(with: startDate)
        
        let query = HKActivitySummaryQuery(predicate: summariesPredicate) { (_, summary, error) in
            
            guard let activitySummary = summary else {
                print("Couldn't get Activity data ")
//                completion(nil, error)
                return
            }
            
//            self.activitySummaryDelegate?.activitySummaryUpdated(activitySummary: activitySummary)
//            guard let activitySummaryFirst = activitySummary.first else { return }
            completion(activitySummary, nil)
            
        }
            
            
        healthKitManager.healthStore.execute(query)
//        return query
    }


}
