//
//  MovieListVM.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit
import Observable

class MovieListVM: BaseVM {
    
    var movieResponse: ResponseMovie!
    var isLoadingList : Bool = false
    var isPopular: Bool!
    var movieList = MutableObservable([Movie]())

    override init() {}
    
    init(_ movieResponse: ResponseMovie) {
        self.movieResponse = movieResponse
        self.movieList.wrappedValue = movieResponse.results
    }
    
    var numberOfMovies: Int {
        return movieList.wrappedValue.count
    }
    
    func getMovieItemVM(_ index:Int) -> MovieItemVM? {
        if numberOfMovies > index {
            return MovieItemVM(movieList.wrappedValue[index])
        }
        return nil
    }
    
    func loadMoreItemsForList() {
        if !(movieResponse.page+1 > movieResponse.total_pages) {
            NetworkManager.shared.response(.getPopularMovies(page: movieResponse.page+1), ResponseMovie.self) { (response) in
                self.movieResponse.page = response.page
                self.isLoadingList = false
                var newList = [Movie]()
                newList.append(contentsOf: self.movieList.wrappedValue)
                newList.append(contentsOf:response.results)
                self.movieList.wrappedValue = newList
            }
        }
    }
    
    func goToMovieDetail(_ index: Int) {
        NavigationManager.shared.navigateTo(.movieDetail, MovieDetailVM(movieList.wrappedValue[index]))
    }
    
    
    
}
