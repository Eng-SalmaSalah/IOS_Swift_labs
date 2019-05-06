//
//  Manager.swift
//  SalaryCalculation
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation
class Manager : Person {
    override var salary : Double{
        get{
            return originalSalary*1.5
        }
    }
}
