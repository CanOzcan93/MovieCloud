//
//  MovieDetailVM.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit
import Observable

class MovieDetailVM: BaseVM {
    
    private var movie: Movie!
    var cast = MutableObservable([Person]())

    override init() {}
    
    init(_ movie: Movie) {
        self.movie = movie
    }
    
    var title: String {
        return movie.title
    }
    
    var originalTitle: String {
        return movie.original_title
    }
    
    var originalLanguage: String {
        return movie.original_language
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
    
    var overview: String {
        return movie.overview
    }
    
    var genres: String {
        var str = ""
        for id in movie.genre_ids {
            str = "\(str)\(DataManager.shared.genres?.first(where: {$0.id == id})?.name ?? ""),"
        }
        str.removeLast()
        return str
    }
    
    func loadCast() {
        NetworkManager.shared.response(.getCredit(movieID: movie.id), ResponseCast.self) { (response) in
            self.cast.wrappedValue = response.cast
        }
    }
    
    func goToPerson(_ id: Int) {
        NetworkManager.shared.response(.getPerson(id: id), Person.self) { (response) in
            NavigationManager.shared.navigateTo(.personDetail, PersonDetailVM(response))
        }
    }
    
}
