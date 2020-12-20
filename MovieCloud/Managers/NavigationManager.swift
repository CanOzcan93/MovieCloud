//
//  NavigationManager.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit

class NavigationManager {
    
    static let shared = NavigationManager()
    
    var navigationVC: UINavigationController? {
        if let window = keyWindow,
            let navigationVC = window.rootViewController as? UINavigationController {
            return navigationVC
        }
        return nil
    }
    
    func navigateTo(_ type: ControllerType,_ data: Any? = nil) {
        let pushVC = ControllerFactory.shared.createVC(type)
        pushVC.data = data
        if let navigationVC = navigationVC {
            navigationVC.pushViewController(pushVC, animated: true)
        } else if let rootVC = UIApplication.shared.delegate?.window??.rootViewController {
            rootVC.present(pushVC, animated: false)
        }
    }
    
    func setRootController(_ controllerType: ControllerType) {
        if let window = keyWindow {
            let snapshot = (window.snapshotView(afterScreenUpdates: true))!
            let rootVC = ControllerFactory.shared.createVC(controllerType)
            rootVC.view.addSubview(snapshot)
            window.rootViewController = rootVC
            
            UIView.transition(with: snapshot,
                              duration: 0.4,
                              options: .transitionCrossDissolve,
                              animations: {
                                  snapshot.layer.opacity = 0
                              },
                              completion: { status in
                                  snapshot.removeFromSuperview()
                              })
        }
    }
    
    func popViewController() {
        if let navigationVC = navigationVC {
            navigationVC.popViewController(animated: true)
        } else if let rootVC = UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController {
            rootVC.popViewController(animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationVC = navigationVC {
            navigationVC.popToRootViewController(animated: true)
        } else if let rootVC = UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController {
            rootVC.popToRootViewController(animated: true)
        }
    }
    
}
