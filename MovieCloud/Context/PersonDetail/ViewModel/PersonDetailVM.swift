//
//  PersonDetailVM.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit


class PersonDetailVM: BaseVM {
    
    private var person: Person!
    
    init(_ person: Person) {
        self.person = person
    }
    
    var name : String {
        return person.name
    }
    
    var popularity : Double {
        return person.popularity
    }
    
    var profilePath : String {
        return person.profile_path
    }
    
    var birthday: String {
        return person.birthday
    }
    
    var place_of_birth: String {
        return person.place_of_birth
    }
    
    var alsoKnown: String {
        var str = ""
        for place in person.also_known_as {
            str = "\(str)\(place)\n"
        }
//        str.removeLast()
        return str
    }
    
}
