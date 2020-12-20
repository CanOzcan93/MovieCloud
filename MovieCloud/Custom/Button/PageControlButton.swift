//
//  PageControlButton.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit

class PageControlButton: UIButton {
    
    var isActive = false {
        didSet {
            self.backgroundColor = isActive ? .primaryColor : .activeTagBgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = true
        titleLabel?.font = .boldSystemFont(ofSize: 16)
        setTitleColor(.buttonTextColor, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }

}
