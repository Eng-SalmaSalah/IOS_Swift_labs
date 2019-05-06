//
//  MyTableViewController.swift
//  MoviesTableView
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit


class MyTableViewController: UITableViewController,addProtocol {

    
    var movies = [Movie]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        let movie1=Movie(title: "District 9", rating: 8, releaseYear: 2009, image: "movie1.jpg", genre: ["Action", "Sci-Fi", "Thriller"])
        movies.append(movie1)
        
        let movie2=Movie(title: "Transformers: Age of Extinction", rating: 6.3, releaseYear: 2014, image: "movie2.jpg", genre: ["Action", "Adventure", "Sci-Fi"])
        movies.append(movie2)
        
        let movie3=Movie(title: "X-Men: Days of Future Past", rating: 8.4, releaseYear: 2014, image: "movie3.jpg", genre: ["Action", "Sci-Fi", "Thriller"])
        movies.append(movie3)
        
        let movie4=Movie(title: "The Machinist", rating: 7.8, releaseYear: 2004, image: "movie4.jpg", genre: ["Drama", "Thriller"])
        movies.append(movie4)
        
        let movie5=Movie(title: "The Last Samurai", rating: 7.7, releaseYear: 2003, image: "movie5.jpg", genre: ["Action", "Drama", "History"])
        movies.append(movie5)
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
    cell.imageView?.image=UIImage(named:movies[indexPath.row].image)
        cell.textLabel?.text=movies[indexPath.row].title
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="showMovie"{
            var movieDetails = segue.destination as! DetailsViewController
            var selectedMovie = movies[(self.tableView.indexPathForSelectedRow?.row)!]
        movieDetails.movieNameStr = selectedMovie.title
        movieDetails.movieImgStr = selectedMovie.image
        movieDetails.movieYearVal = selectedMovie.releaseYear
        movieDetails.movieGenreVal = selectedMovie.genre
        movieDetails.movieRatingVal = selectedMovie.rating
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
