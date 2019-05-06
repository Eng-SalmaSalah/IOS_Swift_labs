//
//  ViewController.swift
//  SalaryCalculation
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var insertedSalary: UITextField!
    
    @IBOutlet weak var calculatedSal: UILabel!
    @IBAction func employeeSalBtn(_ sender: UIButton) {
        let employee = Employee(id: 1,name: "salma",originalSalary:
            Double(insertedSalary.text!)!)
        calculatedSal.text=employee.salary.description
    }
    
    @IBAction func managerSalBtn(_ sender: UIButton) {
        let manager = Manager(id: 1,name: "salma",originalSalary:
            Double(insertedSalary.text!)!)
        calculatedSal.text=manager.salary.description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

