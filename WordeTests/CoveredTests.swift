//
//  CoveredTests.swift
//  WordeTests
//
//  Created by Damir Aushenov on 17/1/22.
//


import XCTest

@testable import Worde

class CoveredTests:  XCTestCase {
    
    func testMaxWith1And2ShoudReturnSomething() {
        let result = CoveredClass.max(1, 2)
        XCTAssertEqual(result, 2)
    }
}
