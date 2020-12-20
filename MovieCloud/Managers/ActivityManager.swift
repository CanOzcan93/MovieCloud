//
//  ActivityManager.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit
import NVActivityIndicatorView

class ActivityManager {

    static let shared = ActivityManager()
    
    var shouldShowActivity = true
    
    var activityCount = 0
    
    func showActivity() {
        if activityCount == 0, shouldShowActivity {
            showActivityView()
        }
        activityCount += 1
    }

    func hideActivity() {
        if activityCount == 1 {
            hideActivityView()
        }
        activityCount -= 1
    }

    func showActivityView() {
        let size = CGSize(width: 44, height: 44)
        let activityData = ActivityData(size: size,
                                         message: nil,
                                         messageFont: nil,
                                         messageSpacing: nil,
                                         type: .ballBeat,
                                         color: .primaryColor,
                                         padding: nil,
                                         displayTimeThreshold: nil,
                                         minimumDisplayTime: 2,
                                         backgroundColor: nil,
                                         textColor: nil)
       NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, NVActivityIndicatorView.DEFAULT_FADE_IN_ANIMATION)
    }
    
    func hideActivityView() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(NVActivityIndicatorView.DEFAULT_FADE_OUT_ANIMATION)
    }
    
}
