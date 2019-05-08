//
//  TableViewController.swift
//  MoviesNetwork
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import Reachability
import CoreData

class TableViewController: UITableViewController {
    var movies = Array<NSManagedObject>()

    override func viewDidLoad() {
        super.viewDidLoad()
      
      

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate    as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let reachability = Reachability()!
        
        reachability.whenReachable = { reachability in
            print("connected")
            let url = URL (string: "https://api.androidhive.info/json/movies.json")
            let request = URLRequest(url: url!)
            let urlSession = URLSession(configuration: URLSessionConfiguration.default)
            let task = urlSession.dataTask(with: request) { (data, response, error) in
                do{
                    var retrievedJson = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array<Dictionary<String,Any>>
                    for item in retrievedJson{
                        //store retrieved data
                        let entitiy = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext)
                        let movie = NSManagedObject (entity: entitiy!, insertInto: managedContext)
                        movie.setValue(item["title"] as! String, forKey: "mTitle")
                        movie.setValue(item["releaseYear"] as! Int, forKey: "mYear")
                        movie.setValue(item["image"] as! String, forKey: "mImg")
                        movie.setValue(Float(item["rating"]as! NSNumber), forKey: "mRate")
                        movie.setValue((item["genre"] as! [String]).description, forKey: "mGenre")
                        self.movies.append(movie)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                catch{
                    print("error")
                }
                
                }.resume()
        }
        
        reachability.whenUnreachable = { _ in
            print("disconnected")
            let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "Movie")
            do{
                self.movies = try managedContext.fetch(fetchRequest)
            }catch let error as NSError{
                print(error)
            }
            
            self.tableView.reloadData()
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = movies[indexPath.row].value(forKey: "mTitle") as? String
        var img=movies[indexPath.row].value(forKey: "mImg") as? String
        var url = URL(string: img!)
        cell.imageView?.sd_setImage(with:url, placeholderImage: UIImage(named: "placeholder.png"))
       
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var detailsVC = segue.destination as! DetailsViewController
        detailsVC.movie=movies[(self.tableView.indexPathForSelectedRow?.row)!]
   
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
