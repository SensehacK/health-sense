//
//  TypeAlias.swift
//  HealthSense
//
//  Created by Sensehack on 5/25/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import HealthKit

public typealias CompletionHKQuantity = ((HKQuantity?, Error?) -> Void)
public typealias CompletionHKQuery = ((HKQuery?, Error?) -> Void)
public typealias CompletionHKActivity = (([HKActivitySummary]?, Error?) -> Void)

