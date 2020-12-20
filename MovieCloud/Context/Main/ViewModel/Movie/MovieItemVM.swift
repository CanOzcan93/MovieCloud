//
//  MovieItemVM.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit

class MovieItemVM: BaseVM {
    
    private var movie: Movie!

    override init() {}
    
    init(_ movie: Movie) {
        self.movie = movie
    }
    
    var title: String {
        return movie.title
    }
    
    var releaseDate: String {
        return movie.release_date
    }
    
    var popularity: Double {
        return movie.popularity
    }
    
    var posterURL : String {
        return movie.poster_path
    }
    
}
