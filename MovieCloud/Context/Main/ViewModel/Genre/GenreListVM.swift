//
//  GenreListVM.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit
import Observable

class GenreListVM: BaseVM {
    
    var isLoadingList : Bool = false
    var isPopular: Bool!
    var genreList = MutableObservable([Genre]())

    override init() {}
    
    init(_ genres: [Genre]) {
        self.genreList.wrappedValue = genres
    }
    
    var numberOfGenres: Int {
        return self.genreList.wrappedValue.count
    }
    
    func getGenreItemVM(_ index:Int) -> GenreItemVM? {
        if numberOfGenres > index {
            return GenreItemVM(genreList.wrappedValue[index])
        }
        return nil
    }
    
    func goToGenre(_ index:Int) {
        if getGenreItemVM(index) != nil {
            NetworkManager.shared.response(.searchWithGenres(genres: [genreList.wrappedValue[index]]), ResponseMovie.self) { (response) in
                NavigationManager.shared.navigateTo(.genreDetail, MovieListVM(response))
            }
        }
    }
    
}
