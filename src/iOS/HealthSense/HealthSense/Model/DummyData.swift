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
        let one = DummyData(number: "242", count: 15)
        let two = DummyData(number: "35", count: 21)
        let three = DummyData(number: "11", count: 74)
        let four = DummyData(number: "56", count: 57)
        let five = DummyData(number: "46", count: 24)
        
        return [one, two, three, four, five]
    }
//     */
}


