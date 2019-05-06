//
//  Movie.swift
//  MoviesNetwork
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation
class Movie {
    var title : String
    var year : Int
    var rate : Float
    var img : String
    var genre : [String]

    init(title:String,year:Int,rate:Float,img:String,genre:[String]){
        self.title=title
        self.year=year
        self.rate=rate
        self.img=img
        self.genre=genre
    }
}
