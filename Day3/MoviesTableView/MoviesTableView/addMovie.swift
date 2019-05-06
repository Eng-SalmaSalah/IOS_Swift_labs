//
//  addMovie.swift
//  MoviesTableView
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class addMovie: UIViewController {
    var moviesTableView:addProtocol?

    @IBOutlet weak var mGenre: UITextField!
    @IBOutlet weak var mRating: UITextField!
    @IBOutlet weak var mIMGName: UITextField!
    @IBOutlet weak var mYear: UITextField!
    @IBOutlet weak var mTitle: UITextField!
    @IBAction func addBtn(_ sender: UIButton) {
        // to get genres from text field we use split
        //split returns substrings
        //i had to cast substring to strings to create movie obj
        var genreStr=mGenre.text!
        var genreArraySubString=genreStr.split(separator: ",")
        var genreArrayStrings=[String]()
        for item in genreArraySubString{
           genreArrayStrings.append(String(item))
        }
        var newMovie=Movie(title: (mTitle.text)!, rating: Float((mRating.text)!)!, releaseYear: Int((mYear.text)!)!, image: (mIMGName.text)!, genre: genreArrayStrings)
        moviesTableView?.addMovie(newMovie: newMovie)
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
