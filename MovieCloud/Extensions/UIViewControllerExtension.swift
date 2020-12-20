//
//  UIViewControllerExtension.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit

private var dataAssociationKey: UInt8 = 0

extension UIViewController {
    var data: Any? {
        get {
            return objc_getAssociatedObject(self, &dataAssociationKey) as Any?
        }
        set(newValue) {
            objc_setAssociatedObject(self, &dataAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}
