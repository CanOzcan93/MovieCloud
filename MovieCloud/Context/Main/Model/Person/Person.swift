//
//  Person.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import ObjectMapper

class Person: BaseModel {
    
    var id = Int.zero
    var adult = false
    var gender = Int.zero
    var known_for_department = ""
    var name = ""
    var profile_path = ""
    var known_for = [Movie]()
    var popularity = Double.zero
    var also_known_as = [String]()
    var place_of_birth = ""
    var birthday = ""
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        adult <- map["adult"]
        gender <- map["gender"]
        known_for_department <- map["known_for_department"]
        name <- map["name"]
        profile_path <- map["profile_path"]
        known_for <- map["known_for"]
        popularity <- map["popularity"]
        also_known_as <- map["also_known_as"]
        place_of_birth <- map["place_of_birth"]
        birthday <- map["birthday"]
    }
    
}
