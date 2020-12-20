//
//  UITableViewExtension.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//
import UIKit

extension UITableView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .buttonTextColor
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
    }
    
//    func endRefreshing() {
//        ActivityManager.shared.shouldShowActivity = true
//        self.headRefreshControl.endRefreshing()
//    }
    
    func restore() {
        self.backgroundView = nil
    }
}
