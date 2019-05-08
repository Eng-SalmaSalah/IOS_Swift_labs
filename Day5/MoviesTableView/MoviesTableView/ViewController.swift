//
//  ViewController.swift
//  MoviesTableView
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    var movie = Movie(title: "", rating: 0.0, releaseYear: 0, image: "", genre: [String]())
    @IBOutlet weak var movieImg: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    
    @IBOutlet weak var movieGenre: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitle.text!=movie.title;
        print(movie.title)
        //movieTitle.text!=titleStr
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

