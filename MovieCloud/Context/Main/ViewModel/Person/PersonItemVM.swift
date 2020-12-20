//
//  PersonItemVM.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit

class PersonItemVM: BaseVM {
    
    private var person: Person!

    override init() {}
    
    init(_ person: Person) {
        self.person = person
    }
    
    var id : Int {
        return person.id
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
    
}
