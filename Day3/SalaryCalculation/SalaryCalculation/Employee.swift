//
//  Employee.swift
//  SalaryCalculation
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation
class Employee : Person {
    override var salary : Double{
        get{
            return originalSalary*1.2
        }
    }
}
