//
//  HelperFunctions.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit


public typealias Action = (() -> Void)
public typealias ActionWith<ParamType> = ((ParamType) -> Void)
public typealias Function<ReturnType> = (() -> ReturnType)
public typealias FunctionWith<ParamType, ReturnType> = ((ParamType) -> ReturnType)

func delay(_ time: Double, _ completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + time) {
        completion()
    }
}

var keyWindow: UIWindow? {
    return UIApplication.shared.windows.first(where: { $0.isKeyWindow })
}

var deviceHasTopNotch: Bool {
    if #available(iOS 11.0, tvOS 11.0, *) {
        return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
    }
    return false
}
