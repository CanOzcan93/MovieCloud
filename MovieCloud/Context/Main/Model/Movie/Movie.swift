//
//  Movie.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import ObjectMapper

class Movie: BaseModel {
    
    var id = Int.zero
    var adult = false
    var backdrop_path = ""
    var genre_ids = [Int]()
    var original_language = ""
    var original_title = ""
    var overview = ""
    var popularity = Double.zero
    var poster_path = ""
    var release_date = ""
    var title = ""
    var video = false
    var vote_average = Double.zero
    var vote_count = Int.zero
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        adult <- map["adult"]
        backdrop_path <- map["backdrop_path"]
        genre_ids <- map["genre_ids"]
        original_language <- map["original_language"]
        original_title <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
        release_date <- map["release_date"]
        title <- map["title"]
        video <- map["video"]
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]
    }
    
}
