//
//  Calculator.swift
//  CalAssignment
//
//  Created by HARISH NOMULA on 06/06/23.
//

import Foundation

class Calculator{
    
    var list = [String]()
    var input: String
    
    init(){
        list =    [String]()
        input = ""
    }
    
    func push(v:String){
        list.append(input)
        
    }
        
    func calculate() -> Int {
        var result: Int?
        var currentOperator: String?

        guard list.count % 2 == 1 else {
            print("The list is not valid. It should contain an odd number of elements.")
            return 88888888
        }

        for (index, element) in list.enumerated() {
            if index % 2 == 0 {
                guard let value = Int(element) else {
                    print("The provided list is invalid. The element at index \(index) should be an integer.")
                    return 88888888
                }
                if result == nil {
                    result = value
                } else {
                    if let op = currentOperator {
                        switch op {
                        case "+":
                            result! += value
                        case "-":
                            result! -= value
                        case "*":
                            result! *= value
                        case "/":
                            result! /= value
                        default:
                            break
                        }
                    }
                }
            } else {
                if let _ = Int(element) {
                    print("The list is invalid. The element at index \(index) should be an operator.")
                    return 88888888
                }
                currentOperator = element
            }
        }

            return result ?? 0
    }

}
