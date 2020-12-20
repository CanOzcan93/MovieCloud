//
//  Genre.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import ObjectMapper

class Genre: BaseModel {
    
    var id = Int.zero
    var name = ""
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        name <- map["name"]
    }
    
}
