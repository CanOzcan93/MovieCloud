//
//  BaseModel.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import ObjectMapper

class BaseModel: Mappable {
        
    init() {}
    required init?(map: Map) {}
    func mapping(map: Map) {}
    
}
