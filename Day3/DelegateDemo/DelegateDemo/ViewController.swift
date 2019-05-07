//
//  ViewController.swift
//  DelegateDemo
//
//  Created by JETS Mobile Lab - 8 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit


class ViewController: UIViewController , ClearProtocol {
    func clear() {
        input.text=""
    }
    

    @IBOutlet weak var input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController//as! de 3shan b3ml casting w unwrap
        secondVC.firstVC=self
        secondVC.str=input.text!;
    }

    @IBAction func insert(_ sender: UIButton) {
    }
}

