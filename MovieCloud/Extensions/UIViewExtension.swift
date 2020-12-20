//
//  UIViewExtension.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit

extension UIView {
    
    class func loadFromNib<T>(withName nibName: String) -> T? {
        let nib  = UINib.init(nibName: nibName, bundle: nil)
        let nibObjects = nib.instantiate(withOwner: nil, options: nil)
        for object in nibObjects {
            if let result = object as? T {
                return result
            }
        }
        return nil
    }

   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
