//
//  DetailsViewController.swift
//  MoviesNetwork
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var movie=Movie(title: "", year: 0, rate: 0.0, img: "", genre: [String]())
    @IBOutlet weak var mImg: UIImageView!
    @IBOutlet weak var mGenre: UILabel!
    @IBOutlet weak var mRate: UILabel!
    @IBOutlet weak var mName: UILabel!

    @IBOutlet weak var mYear: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        mName.text!=movie.title
        mRate.text!=movie.rate.description
        mYear.text!=movie.year.description
        mGenre.text!=movie.genre.description
        
        //to download img
        var url = URL(string:movie.img)
       
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.mImg!.image = image
            }
            }.resume()
        
        
        
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
