//
//  BaseNavigationView.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit

protocol NavigationViewDelegate: AnyObject {
    func searchText(_ text: String?)
}

class BaseNavigationView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }

    weak var delegate: NavigationViewDelegate?
    
    var title = ""

}
