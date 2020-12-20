//
//  ImageHelper.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit

class ImageHelper: NSObject {

    static let shared = ImageHelper()
    
    var imagesDic = NSMutableDictionary()
    
    func setImageToDic(_ image: UIImage,_ key: String) {
        imagesDic.setValue(image, forKey: key)
    }
    
    func getImageFromDic(_ key: String) -> UIImage? {
        return imagesDic.value(forKey: key) as? UIImage
    }
    
}
