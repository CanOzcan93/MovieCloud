//
//  AppDelegate.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit
#if !RELEASE
import FLEX
#endif

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Logger.shared.level = .info
        Logger.shared.startLogging()
        configureFlex()
        return true
    }
    
    private func configureFlex() {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(AppDelegate.showFlex(sender:)))
        longPressRecognizer.cancelsTouchesInView = true
        #if targetEnvironment(simulator)
        longPressRecognizer.numberOfTouchesRequired = 1
        #else
        longPressRecognizer.numberOfTouchesRequired = 3
        #endif
        window?.addGestureRecognizer(longPressRecognizer)
    }

    @objc private func showFlex(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            #if !RELEASE
            FLEXManager.shared.showExplorer()
            #endif
        }
    }

}

