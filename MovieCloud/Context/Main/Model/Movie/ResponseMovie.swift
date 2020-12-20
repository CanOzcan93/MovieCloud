//
//  ResponseMovie.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import ObjectMapper

class ResponseMovie: BaseModel {
    
    var page = 0
    var results = [Movie]()
    var total_pages = 0
    var total_results = 0
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        page <- map["page"]
        results <- map["results"]
        total_pages <- map["total_pages"]
        total_results <- map["total_results"]
    }
    
}
