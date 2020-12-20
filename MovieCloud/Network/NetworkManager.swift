//
//  NetworkManager.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class NetworkManager {

    static let shared = NetworkManager()
    
    private let manager = NetworkReachabilityManager(host: "www.apple.com")
    
    var isNetworkReachable: Bool {
        return manager?.isReachable ?? false
    }
    
    func response<T: Mappable>(_ router: Router,_ type: T.Type,_ completion: @escaping ((_ response: T) -> Void),_ completionError: Action? = nil) {
        if isNetworkReachable {
            if router.showLoading {
                ActivityManager.shared.showActivity()
            }
            Alamofire.request(router).responseObject { (response: DataResponse<T>) in
                if router.showLoading {
                    ActivityManager.shared.hideActivity()
                }
                if response.response?.statusCode == 200, response.error == nil, let result = response.value  {
                    completion(result)
                } else {
                    completionError?()
                }
            }
        } else {
//            ErrorHelper.shared.showError(noNetwork)
        }
    }
}

private let noNetwork = "İnternet bağlantınızı kontrol ediniz"
private let fileError = "Dosya yüklenirken hata oluştu"
let networkError = "İsteğinizi şu anda gerçekleştiremiyoruz"
