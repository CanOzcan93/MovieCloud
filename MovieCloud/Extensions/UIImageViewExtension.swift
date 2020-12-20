//
//  UIImageViewExtension.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit
import AlamofireImage
import Alamofire

extension UIImageView {
    
    func setImageURL(_ urlString: String,_ completion: Action? = nil) {
        guard let url = URL(string: urlString.imagePath) else {
            return
        }
        if let image = ImageHelper.shared.getImageFromDic(urlString) {
            self.image = image
            completion?()
        } else {
            self.af_cancelImageRequest()
            self.af_setImage(withURL: url, placeholderImage: nil, filter: nil, progress: nil, runImageTransitionIfCached: false) { (response) in
                DispatchQueue.main.async {
                    if let image = response.result.value {
                        ImageHelper.shared.setImageToDic(image, urlString)
                    }
                    completion?()
                }
            }
        }
    }
    
}
