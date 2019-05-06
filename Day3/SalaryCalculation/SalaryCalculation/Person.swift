//
//  Person.swift
//  SalaryCalculation
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation

class Person {
    var id : Int
    var name : String
    var originalSalary : Double
    var salary : Double{
        get{
            return originalSalary*1.0
        }
    }
    init(id : Int,name :String,originalSalary:Double) {
        self.id=id
        self.name=name
        self.originalSalary=originalSalary
    }
}
