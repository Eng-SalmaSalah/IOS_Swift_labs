//
//  Movie.swift
//  MoviesTableView
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation
class Movie{
    var title:String
    var rating:Float
    var releaseYear:Int
    var image:String
    var genre:[String]
    init(title:String,rating:Float,releaseYear:Int,image:String,genre:[String]){
        self.title=title;
        self.rating=rating;
        self.releaseYear=releaseYear;
        self.image=image;
        self.genre=genre;
    }
    
}
