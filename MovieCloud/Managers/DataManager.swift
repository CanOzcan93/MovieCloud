//
//  DataManager.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit

class DataManager {
    
    static let shared = DataManager()
    
    var movies: ResponseMovie?
    var genres: [Genre]?
    var people: ResponsePerson?
    
}
