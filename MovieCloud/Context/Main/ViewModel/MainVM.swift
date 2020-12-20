//
//  MainViewModel.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit
import Observable

class MainVM: BaseVM {
    
    var movieList = MutableObservable(ResponseMovie())
    var genres = MutableObservable([Genre]())
    var personList = MutableObservable(ResponsePerson())
    
    var movieIndex: Int {
        return 0
    }
    
    var genreIndex: Int {
        return 1
    }
    
    var personIndex: Int {
        return 2
    }
    
    var numberOfList: Int {
        return 3
    }
    
    func getMovieListVM(_ index:Int) -> MovieListVM? {
        if index == movieIndex {
            return MovieListVM(movieList.wrappedValue)
        }
        return nil
    }
    
    func getGenreListVM(_ index:Int) -> GenreListVM? {
        if index == genreIndex {
            return GenreListVM(genres.wrappedValue)
        }
        return nil
    }
    
    func getPersonListVM(_ index:Int) -> PersonListVM? {
        if index == personIndex {
            return PersonListVM(personList.wrappedValue)
        }
        return nil
    }
    
    func getFirstData() {
        self.genres.wrappedValue = DataManager.shared.genres ?? [Genre]()
        self.personList.wrappedValue = DataManager.shared.people ?? ResponsePerson()
        self.movieList.wrappedValue = DataManager.shared.movies ?? ResponseMovie()
    }
    
    func search(_ text: String) {
        genres.wrappedValue = DataManager.shared.genres?.filter({$0.name.lowercased().contains(text.lowercased())}) ?? [Genre]()
        NetworkManager.shared.response(.searchMovie(query: text), ResponseMovie.self) { (response) in
            self.movieList.wrappedValue = response
        }
        NetworkManager.shared.response(.searchPerson(query: text), ResponsePerson.self) { (response) in
            self.personList.wrappedValue = response
        }
    }
    
    
}
