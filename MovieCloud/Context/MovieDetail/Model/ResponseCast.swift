//
//  ResponseCast.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import ObjectMapper

class ResponseCast: BaseModel {
    
    var id = 0
    var cast = [Person]()
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        cast <- map["cast"]
    }
    
}
