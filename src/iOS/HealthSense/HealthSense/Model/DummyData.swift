//
//  DummyData.swift
//  HealthSense
//
//  Created by Sensehack on 5/3/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation

class DummyData {
    
    let ddNumber: String
    let ddCount: Double
    
    init(number: String, count: Double) {
        self.ddNumber = number
        self.ddCount = count
    }
    
    ///*
    public static func createDummyData2() -> [DummyData] {
        let one = DummyData(number: "Mon", count: 57)
        let two = DummyData(number: "Tue", count: 70)
        let three = DummyData(number: "Wed", count: 74)
        let four = DummyData(number: "Thur", count: 89)
        let five = DummyData(number: "Fri", count: 70)
        let six = DummyData(number: "Sat", count: 69)
        let seven = DummyData(number: "Sun", count: 65)
        
        return [one, two, three, four, five, six, seven]
    }
//     */
}


