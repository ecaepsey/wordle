//
//  WordeTests.swift
//  WordeTests
//
//  Created by Damir Aushenov on 13/1/22.
//

import XCTest

@testable import Worde

class WordeTests: XCTestCase {
    private var sut: MyClass!
    var viewController: ViewController!

    override  func setUp() {
        super.setUp()
        sut = MyClass()
    }
    
    override  func tearDown() {
        sut = nil
        super.tearDown()
        
    }
    
    func test_methodTwo() {
      
        sut.methodTwo()
    }
    
    func test_methodOne() {
     
        sut.methodOne()
    }

}

