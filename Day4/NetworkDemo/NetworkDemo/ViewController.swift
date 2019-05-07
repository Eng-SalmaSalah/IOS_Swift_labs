//
//  ViewController.swift
//  NetworkDemo
//
//  Created by JETS Mobile Lab - 8 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    override func viewDidLoad() {
        super.viewDidLoad()
//activity indicator f l nos
        activityIndicator.center=view.center
        view.addSubview(activityIndicator)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var output: UILabel!
    @IBAction func startTask(_ sender: UIButton) {
        let url = URL(string : "https://api.androidhive.info/json/movies.json")
        let request = URLRequest (url : url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        activityIndicator.startAnimating()
        //UIApplication.shared.isNetworkActivityIndicatorVisible=true;
        let task = session.dataTask(with: request) {(data, response, error) in
            do{
                var res = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array<Dictionary<String,Any>>
                var dict=res[0]
                print(dict)
                print(dict["title"]!)
                DispatchQueue.main.async {
                    self.output.text=dict["title"]!as?String//3lshan e7na gwa closure
                    UIApplication.shared.isNetworkActivityIndicatorVisible=false;

                }
            }catch{
                print("error")
            }
        }
        task.resume()

    }
}

