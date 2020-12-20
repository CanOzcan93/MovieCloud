//
//  SplashVM.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit

class SplashVM: BaseVM {
    
    func prepare() {
        self.getGenres {
            self.getMovies {
                self.getPerson {
                    NavigationManager.shared.setRootController(.root)
                }
            }
        }
    }
    
    private func getGenres(_ completion: Action?) {
        NetworkManager.shared.response(.getGenres, ResponseGenre.self, { (response) in
            DataManager.shared.genres = response.genres
            completion?()
        }, {
            completion?()
        })
    }
    
    private func getMovies(_ completion: Action?) {
        NetworkManager.shared.response(.getPopularMovies(), ResponseMovie.self, { (response) in
            DataManager.shared.movies = response
            completion?()
        },{
            completion?()
        })
    }
    
    private func getPerson(_ completion: Action?) {
        NetworkManager.shared.response(.getPopularPeople(), ResponsePerson.self, { (responsePerson) in
            DataManager.shared.people = responsePerson
            completion?()
        },{
            completion?()
        })
    }
    
    
}
        
