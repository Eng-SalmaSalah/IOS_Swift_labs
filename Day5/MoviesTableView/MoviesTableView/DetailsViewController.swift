//
//  DetailsViewController.swift
//  MoviesTableView
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var movieNameStr = ""
    var movieYearVal=0
    var movieRatingVal : Float = 0.0
    var movieImgStr=""
    var movieGenreStr = ""
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    
    @IBOutlet weak var moviePoster: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        movieName.text!=movieNameStr
        movieYear.text!=movieYearVal.description
        movieRate.text!=movieRatingVal.description
        movieGenre.text!=movieGenreStr
        moviePoster.image=UIImage(named: movieImgStr)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
