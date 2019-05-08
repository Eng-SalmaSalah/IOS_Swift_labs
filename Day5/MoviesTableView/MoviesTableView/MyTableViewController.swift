//
//  MyTableViewController.swift
//  MoviesTableView
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import CoreData


class MyTableViewController: UITableViewController,addProtocol {
    var movies = Array<NSManagedObject>()
//executed only 1 time when the view is shown firstly
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
//executed on back from the next screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "Movie")
        do{
            movies = try managedContext.fetch(fetchRequest)
        }catch let error as NSError{
            print(error)
        }
        
        self.tableView.reloadData()

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
        cell.textLabel?.text = movies[indexPath.row].value(forKey: "movieTitle") as? String
        cell.imageView?.image=UIImage (named: (movies[indexPath.row].value(forKey: "movieImg") as? String)!)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="showMovie"{
            var movieDetails = segue.destination as! DetailsViewController
            var selectedMovie = movies[(self.tableView.indexPathForSelectedRow?.row)!]
            movieDetails.movieNameStr = selectedMovie.value(forKey: "movieTitle") as! String
        movieDetails.movieImgStr = selectedMovie.value(forKey: "movieImg") as! String
        movieDetails.movieYearVal = selectedMovie.value(forKey: "movieReleaseYear") as! Int
        movieDetails.movieGenreStr = selectedMovie.value(forKey: "movieGenre") as! String
            movieDetails.movieRatingVal = selectedMovie.value(forKey: "movieRating") as! Float
        }
        else if segue.identifier=="AddMovie"{
            print("AddMovie")
            var addMovie = segue.destination as! addMovie
            addMovie.moviesTableView=self;
            
        }
    }
    
    
    func addMovie(newMovie: Movie) {
        movies.append(newMovie)
        self.tableView.reloadData()
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }*/
    
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
