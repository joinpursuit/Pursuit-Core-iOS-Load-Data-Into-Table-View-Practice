//
//  LoadDataIntoTableViewPracticeTests.swift
//  LoadDataIntoTableViewPracticeTests
//
//  Created by Benjamin Stone on 2/14/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import XCTest
@testable import LoadDataIntoTableViewPractice

class LoadDataIntoTableViewPracticeTests: XCTestCase {
    func testFibnacciNumber() {
        XCTAssertEqual(FibonacciNumber.fib(n: 5), 8)
        XCTAssertEqual(FibonacciNumber.fib(n: 11), 144)
    }

    func testPerformanceExample() {
        self.measure {
            _ = FibonacciNumber.fib(n: 90)
        }
    }
}
