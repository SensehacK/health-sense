//
//  HealthSenseTests.swift
//  HealthSenseTests
//
//  Created by Sensehack on 3/24/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import XCTest
@testable import HealthSense

class HealthSenseTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("Hello SEnsehack tests")
//        testExample()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let test = 3
        let squareResult = test * test
    
        XCTAssertEqual(squareResult, 9)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
