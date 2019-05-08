//
//  addMovie.swift
//  MoviesTableView
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import CoreData

class addMovie: UIViewController {
    var moviesTableView:addProtocol?
    var appDelegate:AppDelegate?
    var managedContext:NSManagedObjectContext?
    @IBOutlet weak var mGenre: UITextField!
    @IBOutlet weak var mRating: UITextField!
    @IBOutlet weak var mIMGName: UITextField!
    @IBOutlet weak var mYear: UITextField!
    @IBOutlet weak var mTitle: UITextField!
    @IBAction func addBtn(_ sender: UIButton) {
        
         let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext!)
         let movie = NSManagedObject(entity: entity!, insertInto: managedContext!)
         movie.setValue(mTitle?.text, forKey: "movieTitle")
         movie.setValue(Float((mRating?.text)!), forKey: "movieRating")
         movie.setValue(Int((mYear?.text)!), forKey: "movieReleaseYear")
         movie.setValue(mIMGName?.text, forKey: "movieImg")
         movie.setValue(mGenre?.text, forKey: "movieGenre")
        do{
            try managedContext?.save()
        }catch let error as NSError {
            print(error)
        }
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedContext = appDelegate?.persistentContainer.viewContext
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
