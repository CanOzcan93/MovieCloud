//
//  ControllerFactory.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit

enum ControllerType {
    case splash
    case root
    case main
    case movieDetail
    case personDetail
    case genreDetail
}

class ControllerFactory {

    static let shared = ControllerFactory()
    
    func createVC(_ type: ControllerType) -> UIViewController {
        switch type {
        case .splash:
            return splashVC
        case .root:
            return RootVC(rootViewController: createVC(.main))
        case .main:
            return mainVC
        case .movieDetail:
            return movieDetailVC
        case .personDetail:
            return personDetailVC
        case .genreDetail:
            return genreDetailVC
        }
    }
    
    var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    var splashVC: SplashVC {
        return mainStoryboard.instantiateViewController(withIdentifier: "SplashVC") as! SplashVC
    }
    
    var mainVC: MainVC {
        return MainVC.loadFromNib()
    }
    
    var movieDetailVC: MovieDetailVC {
        return MovieDetailVC.loadFromNib()
    }
    
    var personDetailVC: PersonDetailVC {
        return PersonDetailVC.loadFromNib()
    }
    
    var genreDetailVC: GenreDetailVC {
        return GenreDetailVC.loadFromNib()
    }
    
    
    
    
    
}
