//
//  GenreItemVM.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit

class GenreItemVM: BaseVM {
    
    private var genre: Genre!

    override init() {}
    
    init(_ genre: Genre) {
        self.genre = genre
    }
    
    var id: Int {
        return genre.id
    }
    
    var name: String {
        return genre.name
    }
    
}
