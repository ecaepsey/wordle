//
//  MyClass.swift
//  Worde
//
//  Created by Damir Aushenov on 14/1/22.
//

import UIKit

class MyClass {
    private static var allInstances = 0
    private let instance: Int
   
    
    
    init() {
        MyClass.allInstances += 1
        instance = MyClass.allInstances
        print(">> MyClass.init()  '\(instance)")
    }
    
    deinit {
        print(">> Myclass.deinit \(instance)")
    }
    
    func methodOne(){
        print(">> methodOne")
    }
    
    func methodTwo(){
        print(">> methodTwo")
    }
}
