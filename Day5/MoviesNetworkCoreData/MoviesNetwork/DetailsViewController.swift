//
//  DetailsViewController.swift
//  MoviesNetwork
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import CoreData
import SDWebImage
class DetailsViewController: UIViewController {
    var movie:NSManagedObject?
    @IBOutlet weak var mImg: UIImageView!
    @IBOutlet weak var mGenre: UILabel!
    @IBOutlet weak var mRate: UILabel!
    @IBOutlet weak var mName: UILabel!

    @IBOutlet weak var mYear: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        mName.text!=movie?.value(forKey: "mTitle") as! String
        mRate.text?=(movie?.value(forKey: "mRate") as! Float).description
        mYear.text!=(movie?.value(forKey: "mYear") as! Int).description
        mGenre.text!=movie?.value(forKey: "mGenre") as! String
        
        //to download img
        //using sdwebimage
        
        var url = URL(string:movie?.value(forKey: "mImg") as! String)
        mImg.sd_setImage(with:url, placeholderImage: UIImage(named: "placeholder.png"))

        
        
        
        /*
       
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
            }.resume()*/
        
        
        
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
