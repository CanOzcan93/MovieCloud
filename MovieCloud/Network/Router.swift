//
//  Router.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import Alamofire

enum Router: URLRequestConvertible {
    
    case getGenres
    case searchMovie(query: String,page: Int = 1)
    case searchPerson(query: String,page: Int = 1)
    case searchWithGenres(genres: [Genre],page: Int = 1)
    case getPopularMovies(page: Int = 1)
    case getPopularPeople(page: Int = 1)
    case getCredit(movieID: Int)
    case getPerson(id: Int)
    
    static private let baseURLString = "https://api.themoviedb.org/3"
    static let apiKey = "eda0bc336e64d50958811035f827588c"
    
    var showLoading : Bool {
        return true
    }
    
    var path: String {
        switch self {
        case .searchMovie(let query,let page):
            return "\("/search/movie".forRequest)&query=\(query)&page=\(page)"
        case .searchWithGenres(let genres,let page):
            var idStr = ""
            for genre in genres{
                idStr = "\(idStr)\(genre.id),"
            }
            idStr.removeLast()
            return "\("/discover/movie".forRequest)&with_genres=\(idStr)&page=\(page)"
        case .getPopularMovies(let page):
            return "\("/movie/popular".forRequest)&page=\(page)"
        case .getPopularPeople(let page):
            return "\("/person/popular".forRequest)&page=\(page)"
        case .getGenres:
            return "/genre/movie/list".forRequest
        case .searchPerson(let query,let page):
            return "\("/search/person".forRequest)&query=\(query)&page=\(page)"
        case .getCredit(let movieID):
            return "\("/movie/\(movieID)/credits".forRequest)"
        case .getPerson(let id):
            return "\("/person/\(id)".forRequest)"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let urlString = Router.baseURLString + path
        guard let urlEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: urlEncoded) else {
            throw URLError(.badURL)
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        urlRequest.timeoutInterval = 15
        return urlRequest
    }
}

extension String {
    var forRequest : String {
        return "\(self)?api_key=\(Router.apiKey)&language=tr-TR"
    }
}
