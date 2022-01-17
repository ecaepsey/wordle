//
//  CoveredClass.swift
//  Worde
//
//  Created by Damir Aushenov on 17/1/22.
//

import Foundation

import UIKit

class CoveredClass {
    fileprivate static func extractedFunc(_ x: Int, _ y: Int) -> Int {
        if x < y {
            return y
        }
        else {
            return x
        }
    }
    
    static func  max(_ x: Int, _ y: Int) -> Int {
        return extractedFunc(x, y)
    }
}
