//
//  ResponseGenre.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import ObjectMapper

class ResponseGenre: BaseModel {
    
    var genres = [Genre]()
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        genres <- map["genres"]
    }
    
}
