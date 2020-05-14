//
//  Extension.swift
//  HealthSense
//
//  Created by Sensehack on 5/14/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import HealthKit

extension Int {
    func format(format: String) -> String {
        return String(format: "%\(format)d", self)
    }
}

extension Double {
    func format(formatter: String) -> String {
        UserStruct.weight = self
        return String(format: "%\(formatter)f", self)
    }
    
    
    func formatWeightLb() -> String {
        return "Weight: \(self.format(formatter: "0.2"))lbs"
    }
    
    
    func formatWeightKg() -> String {
        return "Weight: \(self.format(formatter: "0.2"))kgs"
    }
}
