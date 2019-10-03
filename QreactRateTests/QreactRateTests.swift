//
//  QreactRateTests.swift
//  QreactRateTests
//
//  Created by Huseyn I. Bayramov on 10/3/19.
//  Copyright © 2019 Huseyn I. Bayramov. All rights reserved.
//

import XCTest
@testable import QreactRate

class QreactRateTests: XCTestCase {

    var rate: QRate!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        rate = QRate()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAdd() {
        XCTAssertEqual(rate.add(a: 1, b: 1), 2)
    }
    
    func testMultiply() {
        XCTAssertEqual(rate.multiply(a: 1, b: 2), 2)
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
